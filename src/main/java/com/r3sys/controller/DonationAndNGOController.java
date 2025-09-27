package com.r3sys.controller;

import java.util.Date;
import java.util.List;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.r3sys.dao.DonationNGODao;
import com.r3sys.model.Admin;
import com.r3sys.model.Donation;
import com.r3sys.model.Donor;
import com.r3sys.model.Ngo;
import com.r3sys.model.Request;
import com.r3sys.model.Volunteer;
import com.r3sys.model.VolunteerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DonationAndNGOController {

    @Autowired
    private DonationNGODao dao;

    //Home
    @RequestMapping("/")
    public String openIndexPage() {
        return "index";
    }
    @RequestMapping("/adminDashboard")
    public String showAdminDashboard(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "adminDashboard";
        }
        return "adminDashboard";
    }

    // Admin Login Page
    @RequestMapping("/adminLoginPage")
    public String openAdminLoginPage() {
        return "adminLogin";
    }

    // AdminLogin Page
    @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    public String loginAdmin(HttpServletRequest request, Model model, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = dao.getAdminByEmail(email);

        if (admin != null && admin.getPassword().equals(password)) {
            session.setAttribute("admin", admin);
            return "adminDashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "adminLogin";
        }
    }

   
    //NGO Registration Page
    @RequestMapping("/registerNgoPage")
    public String openNgoRegistrationPage() {
        return "RegisterNgo";
    }

    
 //NGO Registration Action 
    @RequestMapping(value = "/RegisterSuccessfully", method = RequestMethod.POST)
    public String registerNgo(@ModelAttribute Ngo ngo, Model model) {
        ngo.setStatus("pending");
        int id = dao.saveNgo(ngo);
        if (id > 0) {
            return "RegisterSuccessfuly";  // Redirect after successful registration
        } else {
            model.addAttribute("error", "Registration failed. Please try again.");
            return "RegisterNgo";
        }
    }

    //show success page
    @RequestMapping(value = "/RegisterSuccessfully", method = RequestMethod.GET)
    public String showSuccessPage() {
        return "RegisterSuccessfully";
    }
 // NGO login page
    @RequestMapping("/ngoLoginPage")
    public String openNgoLoginPage() {
        return "ngoLoginPage";
    }

    @RequestMapping(value = "/ngoLoginPage", method = RequestMethod.POST)
    public String loginNgo(HttpServletRequest request, Model model, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Ngo ngo = dao.getNgoByEmail(email);

        if (ngo != null && ngo.getPassword().equals(password) && "approved".equalsIgnoreCase(ngo.getStatus())) {
            session.setAttribute("ngo", ngo);
            return "ngoDashboard"; // this should be correct
        } else {
            model.addAttribute("error", "Invalid credentials or approval pending.");
            return "ngoLoginPage"; 
        }
    }
    
 // Show the page with all pending NGO registrations
    @RequestMapping("/approveNgoPage")
    public String showPendingNgos(Model model) {
        List<Ngo> pendingNgos = dao.getPendingNgos(); // fetch NGOs with status='pending'
        model.addAttribute("pendingNgos", pendingNgos);
        return "approveNgo"; // JSP name
    }

    // Handle the approval of a specific NGO by ID
    @RequestMapping(value = "/approveNgo", method = RequestMethod.POST)
    public String approveNgo(@RequestParam("id") int id) {
        Ngo ngo = dao.getNgoById(id);
        if (ngo != null) {
            ngo.setStatus("approved");
            dao.updateNgo(ngo);
        }
        return "redirect:/approveNgoPage";
    }
    @RequestMapping("/postRequestPage")
    public String showPostRequestPage() {
        return "postRequest";
    }

    @RequestMapping(value = "/submitRequest", method = RequestMethod.POST)
    public String submitRequest(HttpServletRequest request, HttpSession session, Model model) {
        Ngo ngo = (Ngo) session.getAttribute("ngo");

     
        if (ngo == null) {
            model.addAttribute("error", "Session expired. Please login again.");
            return "redirect:/ngoLoginPage";
        }

    
        String itemType = request.getParameter("itemType");
        String itemName = request.getParameter("itemName");
        String quantityStr = request.getParameter("quantity_or_amount");
        String description = request.getParameter("description");

        // Logging for debugging
        System.out.println("itemType = " + itemType);
        System.out.println("itemName = " + itemName);
        System.out.println("quantity_or_amount = " + quantityStr);
        System.out.println("description = " + description);

        // innput validation
        if (itemType == null || itemName == null || quantityStr == null || description == null ||
            itemType.trim().isEmpty() || itemName.trim().isEmpty() ||
            quantityStr.trim().isEmpty() || description.trim().isEmpty()) {
            model.addAttribute("error", "All fields are required.");
            return "postRequest";
        }

        int quantity_or_amount;
        try {
            quantity_or_amount = Integer.parseInt(quantityStr.trim());
        } catch (NumberFormatException e) {
            model.addAttribute("error", "Quantity or Amount must be a valid number.");
            return "postRequest";
        }

        //  Save request
        Request req = new Request();
        req.setNgo(ngo);
        req.setItemType(itemType);
        req.setItemName(itemName);
        req.setQuantity_or_amount(quantity_or_amount);
        req.setDescription(description);
        req.setStatus("pending");

        dao.saveRequest(req);

        return "RequestSuccess";

    }

    @RequestMapping("/viewNgoRequestPage")
    public String viewAllNgoRequests(Model model) {
        List<Ngo> approvedNgos = dao.getApprovedNgos();  // fetch only approved NGOs
        model.addAttribute("approvedNgos", approvedNgos);
        return "viewNgoRequestPage"; // This JSP displays dropdown and request table
    }

    @RequestMapping(value = "/viewNgoRequestPage", method = RequestMethod.POST)
    public String showRequestsByNgo(@RequestParam("ngoId") int ngoId, Model model) {
        List<Ngo> approvedNgos = dao.getApprovedNgos(); // To repopulate dropdown
        List<Request> requests = dao.getRequestsByNgoId(ngoId);

        model.addAttribute("approvedNgos", approvedNgos);
        model.addAttribute("requests", requests);
        model.addAttribute("selectedNgoId", ngoId);
        return "viewNgoRequestPage";
    }

 // Show donor registration form
    @RequestMapping("/donorRegisterPage")
    public String showDonorRegisterPage(Model model) {
        model.addAttribute("donor", new Donor()); // Binds empty Donor object to form
        return "donorRegisterPage"; // JSP file name
    }

    // Handle donor form submission
    @RequestMapping(value = "/registerDonor", method = RequestMethod.POST)
    public String registerDonor(@ModelAttribute("donor") Donor donor, Model model) {
        try {
            int id = dao.saveDonor(donor); // Saves donor using DAO
            if (id > 0) {
                return "RegisterSuccessfuly"; // Redirect to success page
            } else {
                model.addAttribute("error", "Registration failed.");
                return "donorRegisterPage";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Exception: " + e.getMessage());
            return "donorRegisterPage";
        }
    
}    
 // Show Donor Login Page
    @RequestMapping("/donorLoginPage")
    public String showDonorLoginPage() {
        return "donorLoginPage"; 
    }

    // Handle Login POST
    @RequestMapping(value = "/donorLogin", method = RequestMethod.POST)
    public String donorLogin(@RequestParam String email,
                             @RequestParam String password,
                             HttpSession session,
                             Model model) {

        Donor donor = dao.getDonorByEmailAndPassword(email, password);

        if (donor != null) {
            session.setAttribute("donor", donor);  // Set donor in session
            return "donorDashboard"; // Redirect to donor dashboard
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "donorLoginPage";
        }
    }
    
    //viewing ngo request by Donor
    @RequestMapping("/donorViewNgoRequestsPage")
    public String viewNgoRequestsPage(Model model) {
        List<Request> allRequests = dao.getAllApprovedRequests();
        model.addAttribute("requests", allRequests);
        return "donorViewNgoRequests";
    }

    @RequestMapping(value = "/searchRequests", method = RequestMethod.POST)
    public String searchRequests(@RequestParam String keyword, Model model) {
        List<Request> filtered = dao.searchRequestsByCategoryOrCity(keyword);
        model.addAttribute("requests", filtered);
        model.addAttribute("keyword", keyword);
        return "donorViewNgoRequests";
    }
//danation
    @RequestMapping(value = "/donatePage", method = RequestMethod.GET)
    public String showDonatePage(Model model) {
        List<Ngo> approvedNgos = dao.getApprovedNgos();
        model.addAttribute("approvedNgos", approvedNgos);
        return "donatePage";
    }



    @RequestMapping(value = "/submitDonation", method = RequestMethod.POST)
    public String submitDonation(HttpServletRequest req, HttpSession session, Model model) {
        Donor donor = (Donor) session.getAttribute("donor");
        if (donor == null) return "redirect:donorLoginPage";

        try {
            String itemType = req.getParameter("itemType");
            String itemName = req.getParameter("itemName");
            String quantityStr = req.getParameter("quantity_or_amount");
            String ngoIdStr = req.getParameter("ngoId");

            if (itemType == null || quantityStr == null || ngoIdStr == null || quantityStr.isEmpty()) {
                model.addAttribute("error", "All fields are required.");
                return "donatePage";
            }

            double amount = Double.parseDouble(quantityStr);
            int ngoId = Integer.parseInt(ngoIdStr);
            Ngo ngo = dao.getNgoById(ngoId);

            Donation donation = new Donation();
            donation.setDonor(donor);
            donation.setNgo(ngo);
            donation.setItemType(itemType);
            donation.setItemName(itemName != null ? itemName : "");
            donation.setQuantity_or_amount(amount);
            donation.setDonatedOn(new Date());
            donation.setStatus("pending");

            dao.saveDonation(donation);

            model.addAttribute("message", "Donation submitted to " + ngo.getName() + " successfully!");
            return "donationSuccess";

        } catch (NumberFormatException e) {
            model.addAttribute("error", "Invalid number format.");
            return "donatePage";
        } catch (Exception e) {
            model.addAttribute("error", "An unexpected error occurred.");
            return "donatePage";
        }
    }
    
    //Donation History
    
    @RequestMapping("/donationHistory")
    public String viewDonationHistory(HttpSession session, Model model) {
        Donor donor = (Donor) session.getAttribute("donor");
        if (donor == null) {
            return "redirect:donorLoginPage";
        }

        List<Donation> donationList = dao.getDonationsByDonorId(donor.getId());
        model.addAttribute("donations", donationList);
        return "donationHistory";
    }
//Donor Offers
    @RequestMapping("/viewDonorOffers")
    public String viewDonorOffers(HttpSession session, Model model) {
        Ngo ngo = (Ngo) session.getAttribute("ngo");
        if (ngo == null) {
            return "redirect:ngoLoginPage";
        }

        List<Donation> offers = dao.getDonationsForNgo(ngo.getId());
        model.addAttribute("offers", offers);
        return "ngoDonorOffers";  // JSP page
    }


        // Load update form
        @RequestMapping(value = "/editDonationStatus", method = RequestMethod.GET)
        public String showUpdateForm(@RequestParam("id") int id, Model model, HttpSession session) {
            Ngo ngo = (Ngo) session.getAttribute("ngo");
            if (ngo == null) return "redirect:ngoLoginPage";

            Donation donation = dao.getDonationById(id);
            model.addAttribute("donation", donation);
            return "updateDonationStatus";
        }

        // Handle form submission
        @RequestMapping(value = "/updateDonationStatus", method = RequestMethod.POST)
        public String updateDonationStatus(@RequestParam("id") int id,
                                           @RequestParam("status") String status,
                                           HttpSession session) {
            Ngo ngo = (Ngo) session.getAttribute("ngo");
            if (ngo == null) return "redirect:ngoLoginPage";

            dao.updateDonationStatus(id, status);
            return "redirect:viewDonorOffers";
        }

        // Optional: Handle accidental GET requests to updateDonationStatus
        @RequestMapping(value = "/updateDonationStatus", method = RequestMethod.GET)
        public String preventGetUpdateStatus() {
            return "redirect:viewDonorOffers"; // Or show error page
        }
        @RequestMapping("/trackDonations")
        public String trackDonations(HttpSession session, Model model) {
            Ngo ngo = (Ngo) session.getAttribute("ngo");
            if (ngo == null) {
                return "redirect:ngoLoginPage";
            }

            List<Donation> donations = dao.getDonationsByNgoId(ngo.getId());
            model.addAttribute("donations", donations);
            return "trackDonations"; // JSP page name
        }
        //ViewDonation By Admin
        @RequestMapping("/viewAllDonations")
        public String viewAllDonations(Model model, HttpSession session) {
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin == null) {
                return "redirect:adminLoginPage";
            }

            List<Donation> donations = dao.getAllDonations();
            model.addAttribute("donations", donations);
            return "viewAllDonations"; // JSP page
        }
        @RequestMapping("/searchDonationsByNgo")
        public String searchDonationsByNgo(@RequestParam("ngoName") String ngoName, Model model, HttpSession session) {
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin == null) return "redirect:adminLoginPage";

            List<Donation> donations = dao.searchDonationsByNgoName(ngoName);
            model.addAttribute("donations", donations);
            return "viewAllDonations";
        }
     // Show the registration form (GET)
        @RequestMapping(value = "/volunteerRegisterPage", method = RequestMethod.GET)
        public String showVolunteerRegisterPage() {
            return "volunteerRegister"; // JSP page that contains the form
        }

        // Handle the form submission (POST)
        @RequestMapping(value = "/registerVolunteer", method = RequestMethod.POST)
        public String registerVolunteer(HttpServletRequest req) {
            Volunteer v = new Volunteer();
            v.setName(req.getParameter("name"));
            v.setEmail(req.getParameter("email"));
            v.setContact(req.getParameter("contact"));
            v.setPassword(req.getParameter("password"));
            v.setCity(req.getParameter("city"));

            dao.saveVolunteer(v);
            return "volunteerLogin"; // Redirect or return login JSP page
        }
        @RequestMapping(value = "/volunteerLoginPage", method = RequestMethod.GET)
        public String showVolunteerLoginPage() {
            return "volunteerLogin"; // returns volunteerLogin.jsp
        }

        @RequestMapping(value = "/loginVolunteer", method = RequestMethod.POST)
        public String loginVolunteer(HttpServletRequest req, HttpSession session) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            Volunteer v = dao.getVolunteerByEmailAndPassword(email, password);
            if (v != null) {
                session.setAttribute("volunteer", v);
                return "volunteerDashboard"; // Redirect to dashboard on success
            } else {
                req.setAttribute("error", "Invalid email or password.");
                return "volunteerLogin"; // Reload login page with error
            }
        }
     // Load Assign Task Page
        @RequestMapping("/assignVolunteerTasks")
        public String loadAssignVolunteerTasks(Model model) {
            List<Donation> donations = dao.getUnassignedAcceptedDonations();
            List<Volunteer> volunteers = dao.getAllVolunteers();

            model.addAttribute("donations", donations);
            model.addAttribute("volunteers", volunteers);

            return "assignVolunteerTask"; // JSP page name
        }

        // Handle form submission
        @RequestMapping(value = "/assignTask", method = RequestMethod.POST)
        public String assignVolunteerTask(@RequestParam("donationId") int donationId,
                                          @RequestParam("volunteerId") int volunteerId,
                                          @RequestParam("pickupAddress") String pickupAddress,
                                          @RequestParam("deliveryAddress") String deliveryAddress,
                                          RedirectAttributes redirectAttributes) {

            dao.assignVolunteerTask(donationId, volunteerId, pickupAddress, deliveryAddress);
            redirectAttributes.addFlashAttribute("message", "Volunteer assigned successfully!");
            return "redirect:assignVolunteerTasks";
        }

        @RequestMapping("/viewNearbyDeliveryTasks")
        public String viewNearbyDeliveryTasks(HttpSession session, HttpServletRequest request) {
            Volunteer volunteer = (Volunteer) session.getAttribute("volunteer");
            if (volunteer == null) {
                return "redirect:volunteerLogin";
            }

            String city = volunteer.getCity();
            List<VolunteerTask> tasks = dao.getNearbyTasksForVolunteer(city);
            
            request.setAttribute("tasks", tasks);
            return "volunteerNearbyTasks";
        }
        
        @RequestMapping("/acceptAndMarkDelivered")
        public String showAcceptAndMarkPage(HttpSession session, Model model) {
            Volunteer volunteer = (Volunteer) session.getAttribute("volunteer");
            if (volunteer != null) {
                List<VolunteerTask> tasks = dao.getTasksByVolunteer(volunteer.getId());
                model.addAttribute("tasks", tasks);
                return "acceptAndMarkDelivered";
            } else {
                return "redirect:/volunteerLogin";
            }
        }

        @RequestMapping("/acceptTask")
        public String acceptTask(@RequestParam("taskId") int taskId) {
            dao.acceptTask(taskId);
            return "redirect:/acceptAndMarkDelivered";
        }

        @RequestMapping("/markDelivered")
        public String markDelivered(@RequestParam("taskId") int taskId) {
            dao.markTaskAsDelivered(taskId);
            return "redirect:/acceptAndMarkDelivered";
        }

     // VolunteerController.java

        @RequestMapping("/trackTaskHistory")
        public String trackTaskHistory(HttpSession session, Model model) {
            Volunteer volunteer = (Volunteer) session.getAttribute("volunteer");

            if (volunteer == null) {
                return "redirect:/volunteerLogin";  //  Redirect instead of showing login page directly
            }

            List<VolunteerTask> taskHistory = dao.getTaskHistoryByVolunteer(volunteer.getId());
            model.addAttribute("taskHistory", taskHistory);
            return "track_task_history";
        }
    
     // In AdminController.java

        @Autowired
        private DonationNGODao donationNGODao;

        @RequestMapping(value = "/generateReport", method = {RequestMethod.GET, RequestMethod.POST})
        public String generateReport(@RequestParam(value = "month", required = false) Integer month,
                                     @RequestParam(value = "year", required = false) Integer year,
                                     HttpServletRequest request) {
            if (month != null && year != null) {
                List<Donation> reportList = donationNGODao.getDonationsByMonthAndYear(month, year);
                request.setAttribute("reportList", reportList);
            }
            return "monthly_report";
        }
        
        //Password change of Admin
        
     // Show Change Password Page
        @RequestMapping("/adminChangePasswordPage")
        public String showAdminChangePasswordPage() {
            return "adminChangePassword"; // JSP page
        }

        // Handle Change Password
        @RequestMapping(value = "/adminChangePassword", method = RequestMethod.POST)
        public String changeAdminPassword(HttpSession session,
                                          @RequestParam("oldPassword") String oldPassword,
                                          @RequestParam("newPassword") String newPassword,
                                          @RequestParam("confirmPassword") String confirmPassword,
                                          Model model) {
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin == null) {
                return "redirect:/adminLoginPage";
            }

            if (!admin.getPassword().equals(oldPassword)) {
                model.addAttribute("error", "Old password is incorrect.");
                return "adminChangePassword";
            }

            if (!newPassword.equals(confirmPassword)) {
                model.addAttribute("error", "New password and confirm password do not match.");
                return "adminChangePassword";
            }

            dao.updateAdminPassword(admin.getId(), newPassword);
            model.addAttribute("message", "Password changed successfully!");
            return "adminDashboard";  // redirect back to dashboard
        }
 //Change Password for NGO
        
     // Show Change Password Page
        @RequestMapping("/ngoChangePasswordPage")
        public String showNgoChangePasswordPage() {
            return "ngoChangePassword"; // JSP page
        }
        
        @RequestMapping(value = "/ngoChangePassword", method = RequestMethod.POST)
        public String changeNgoPassword(HttpSession session,
                                        @RequestParam("oldPassword") String oldPassword,
                                        @RequestParam("newPassword") String newPassword,
                                        @RequestParam("confirmPassword") String confirmPassword,
                                        RedirectAttributes redirectAttributes) {
            Ngo ngo = (Ngo) session.getAttribute("ngo");
            if (ngo == null) {
                return "redirect:/ngoLoginPage";
            }

            if (!ngo.getPassword().equals(oldPassword)) {
                redirectAttributes.addFlashAttribute("error", "Old password is incorrect.");
                return "redirect:/ngoChangePasswordPage";
            }

            if (!newPassword.equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("error", "New password and confirm password do not match.");
                return "redirect:/ngoChangePasswordPage";
            }

            dao.updateNgoPassword(ngo.getId(), newPassword);

            session.invalidate();

            redirectAttributes.addFlashAttribute("message", "Password changed successfully. Please login again.");
            return "redirect:/ngoLoginPage";
        }
        
        //Change Password for Donor
        
        @RequestMapping("/donorChangePasswordPage")
        public String showDonorChangePasswordPage() {
            return "donorChangePassword"; // JSP page
        }

        @RequestMapping(value = "/donorChangePassword", method = RequestMethod.POST)
        public String changeDonorPassword(HttpSession session,
                                          @RequestParam("oldPassword") String oldPassword,
                                          @RequestParam("newPassword") String newPassword,
                                          @RequestParam("confirmPassword") String confirmPassword,
                                          RedirectAttributes redirectAttributes) {
            Donor donor = (Donor) session.getAttribute("donor");
            if (donor == null) {
                return "redirect:/donorLoginPage";
            }

            if (!donor.getPassword().equals(oldPassword)) {
                redirectAttributes.addFlashAttribute("error", "Old password is incorrect.");
                return "redirect:/donorChangePasswordPage";
            }

            if (!newPassword.equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("error", "New password and confirm password do not match.");
                return "redirect:/donorChangePasswordPage";
            }

            dao.updateDonorPassword(donor.getId(), newPassword);

            session.invalidate();

            redirectAttributes.addFlashAttribute("message", "Password changed successfully. Please login again.");
            return "redirect:/donorLoginPage";
        }

        //Change password for Volunteer
     // Show Volunteer Change Password Page
        @RequestMapping("/volunteerChangePasswordPage")
        public String showVolunteerChangePasswordPage() {
            return "volunteerChangePassword"; // JSP page
        }

        // Handle Volunteer Change Password
        @RequestMapping(value = "/volunteerChangePassword", method = RequestMethod.POST)
        public String changeVolunteerPassword(HttpSession session,
                                              @RequestParam("oldPassword") String oldPassword,
                                              @RequestParam("newPassword") String newPassword,
                                              @RequestParam("confirmPassword") String confirmPassword,
                                              RedirectAttributes redirectAttributes) {
            Volunteer volunteer = (Volunteer) session.getAttribute("volunteer");
            if (volunteer == null) {
                return "redirect:/volunteerLoginPage";
            }

            if (!volunteer.getPassword().equals(oldPassword)) {
                redirectAttributes.addFlashAttribute("error", "Old password is incorrect.");
                return "redirect:/volunteerChangePasswordPage";
            }

            if (!newPassword.equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("error", "New password and confirm password do not match.");
                return "redirect:/volunteerChangePasswordPage";
            }

            dao.updateVolunteerPassword(volunteer.getId(), newPassword);

            session.invalidate();

            redirectAttributes.addFlashAttribute("message", "Password changed successfully. Please login again.");
            return "redirect:/volunteerLoginPage";
        }

        

}
    
