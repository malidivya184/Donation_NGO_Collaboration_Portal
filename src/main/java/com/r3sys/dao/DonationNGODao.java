package com.r3sys.dao;

import java.io.Serializable;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.transaction.annotation.Transactional; // ✅ This is correct!

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.r3sys.model.Admin;
import com.r3sys.model.Donation;
import com.r3sys.model.Donor;
import com.r3sys.model.Request;
import com.r3sys.model.Ngo;
import com.r3sys.model.Transaction;
import com.r3sys.model.Volunteer;
import com.r3sys.model.VolunteerTask;

@Repository
public class DonationNGODao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    // ✅ Admin Login
    public Admin getAdminByEmail(String email) {
        Session session = hibernateTemplate.getSessionFactory().openSession();
        Admin admin = null;
        try {
            String hql = "from Admin where email = :email";
            admin = session.createQuery(hql, Admin.class)
                           .setParameter("email", email)
                           .uniqueResult();
        } finally {
            session.close();
        }
        return admin;
    }

    public List<Ngo> getPendingNgos() {
        String hql = "from Ngo where status='pending'";
        return (List<Ngo>) hibernateTemplate.find(hql);
    }

    public Ngo getNgoById(int id) {
        return hibernateTemplate.get(Ngo.class, id);
    }

    @Transactional
    public void updateNgo(Ngo ngo) {
        hibernateTemplate.update(ngo);
    }

    // ✅ Register new NGO
  
    @Transactional
    public int saveNgo(Ngo ngo) {
        Serializable id = hibernateTemplate.save(ngo);
        return Integer.parseInt(id.toString());
    }

    public Ngo getNgoByEmail(String email) {
        Session session = hibernateTemplate.getSessionFactory().openSession();
        Ngo ngo = null;
        try {
            String hql = "from Ngo where email = :email";
            ngo = session.createQuery(hql, Ngo.class)
                         .setParameter("email", email)
                         .uniqueResult();
        } finally {
            session.close();
        }
        return ngo;
    }
    @Transactional
    public void saveRequest(Request request) {
        hibernateTemplate.save(request);
    }

    public List<Ngo> getApprovedNgos() {
        String hql = "FROM Ngo WHERE status = 'approved'";
        return (List<Ngo>) hibernateTemplate.find(hql);
    }

    public List<Request> getRequestsByNgoId(int ngoId) {
        Session session = hibernateTemplate.getSessionFactory().openSession();
        List<Request> requests = null;

        try {
            String hql = "FROM Request WHERE ngo.id = :ngoId";
            requests = session.createQuery(hql, Request.class)
                              .setParameter("ngoId", ngoId)
                              .list();
        } finally {
            session.close();
        }
        return requests;
    }
 // ✅ Save Donor
    @Transactional
    public int saveDonor(Donor donor) {
        Serializable id = hibernateTemplate.save(donor);
        return Integer.parseInt(id.toString());
    }
//Donor login
    public Donor getDonorByEmailAndPassword(String email, String password) {
        String hql = "FROM Donor WHERE email = :email AND password = :password";
        List<Donor> list = (List<Donor>) hibernateTemplate.findByNamedParam(
                hql, 
                new String[] { "email", "password" },
                new Object[] { email, password });

        return list.isEmpty() ? null : list.get(0);
    }
    //viwing NGO Request by Donor
    public List<Request> getAllApprovedRequests() {
        String hql = "FROM Request r WHERE r.ngo.status = 'approved'";
        return (List<Request>) hibernateTemplate.find(hql);
    }

    public List<Request> searchRequestsByCategoryOrCity(String keyword) {
        Session session = hibernateTemplate.getSessionFactory().openSession();
        List<Request> list = null;
        try {
            String hql = "FROM Request r WHERE r.ngo.status = 'approved' AND (r.itemType LIKE :kw OR r.ngo.city LIKE :kw)";
            list = session.createQuery(hql, Request.class)
                          .setParameter("kw", "%" + keyword + "%")
                          .list();
        } finally {
            session.close();
        }
        return list;
    }
//Donation
    
    @Transactional
    public void saveDonation(Donation donation) {
        hibernateTemplate.save(donation);
    }
    
 //Donation History
    public List<Donation> getDonationsByDonorId(int donorId) {
        String hql = "FROM Donation WHERE donor.id = :donorId ORDER BY donationDate DESC";
        return (List<Donation>) hibernateTemplate.findByNamedParam(hql, "donorId", donorId);
    }

//Donor Offer
    public List<Donation> getDonationsForNgo(int ngoId) {
        String hql = "FROM Donation WHERE ngo.id = :ngoId ORDER BY donationDate DESC";
        Session session = hibernateTemplate.getSessionFactory().openSession();
        List<Donation> list = null;
        try {
            list = session.createQuery(hql, Donation.class)
                          .setParameter("ngoId", ngoId)
                          .list();
        } finally {
            session.close();
        }
        return list;
    }
    //Donor accept and Reject
    @Transactional
    public void updateDonationStatus(int id, String status) {
        Donation donation = hibernateTemplate.get(Donation.class, id);
        if (donation != null) {
            donation.setStatus(status);
            hibernateTemplate.update(donation);
        }
    }

    public Donation getDonationById(int id) {
        return hibernateTemplate.get(Donation.class, id);
    }
    public List<Donation> getDonationsByNgo(int ngoId) {
        String hql = "FROM Donation WHERE ngo.id = ?";
        return (List<Donation>) hibernateTemplate.find(hql, ngoId);
    }
//Donation track public List<Donation> getDonationsByNgoId(int ngoId) {
    
    public List<Donation> getDonationsByNgoId(int ngoId) {
        return (List<Donation>) hibernateTemplate.findByNamedParam(
            "from Donation where ngo.id = :ngoId", 
            "ngoId", 
            ngoId
        );
    }
    
    //ViewDonatoion
    @Transactional
    public List<Donation> getAllDonations() {
        return (List<Donation>) hibernateTemplate.find("from Donation");
    }
    @Transactional
    public List<Donation> searchDonationsByNgoName(String ngoName) {
        return (List<Donation>) hibernateTemplate.find("from Donation d where lower(d.ngo.name) like ?", "%" + ngoName.toLowerCase() + "%");
    }
    @Transactional
    public int saveVolunteer(Volunteer volunteer) {
        Serializable id = hibernateTemplate.save(volunteer);
        return Integer.parseInt(id.toString());
    }

    public Volunteer getVolunteerByEmailAndPassword(String email, String password) {
        String hql = "FROM Volunteer WHERE email = :email AND password = :password";
        List<Volunteer> list = (List<Volunteer>) hibernateTemplate.findByNamedParam(
            hql,
            new String[] { "email", "password" },
            new Object[] { email, password }
        );
        return list.isEmpty() ? null : list.get(0);
    }
    
    //Volunteer task assign vy Admin
 // Get all volunteers for assigning
    public List<Volunteer> getAllVolunteers() {
        return (List<Volunteer>) hibernateTemplate.find("from Volunteer");
    }

    // Get donations that are accepted and not yet assigned
    public List<Donation> getUnassignedAcceptedDonations() {
        String hql = "FROM Donation d WHERE d.status = 'accepted' AND d.id NOT IN " +
                     "(SELECT vt.donation.id FROM VolunteerTask vt)";
        return (List<Donation>) hibernateTemplate.find(hql);
    }

    // Save VolunteerTask
    @Transactional
    public void assignVolunteerTask(int donationId, int volunteerId, String pickupAddress, String deliveryAddress) {
        Donation donation = hibernateTemplate.get(Donation.class, donationId);
        Volunteer volunteer = hibernateTemplate.get(Volunteer.class, volunteerId);

        if (donation != null && volunteer != null) {
            VolunteerTask task = new VolunteerTask();
            task.setDonation(donation);
            task.setVolunteer(volunteer);
            task.setPickupAddress(pickupAddress);
            task.setDeliveryAddress(deliveryAddress);
            task.setStatus("assigned");

            hibernateTemplate.save(task);
        }
    }
// view near Volunteer task
    @SuppressWarnings("unchecked")
    public List<VolunteerTask> getNearbyTasksForVolunteer(String city) {
        String hql = "FROM VolunteerTask vt WHERE vt.pickupAddress = :city AND vt.status = 'assigned'";
        return (List<VolunteerTask>) hibernateTemplate.findByNamedParam(hql, "city", city);
    }
    @Transactional
    public void acceptTask(int taskId) {
        VolunteerTask task = hibernateTemplate.get(VolunteerTask.class, taskId);
        if (task != null && "Assigned".equalsIgnoreCase(task.getStatus())) {
            task.setStatus("Accepted");
            hibernateTemplate.update(task);
        }
    }

    @Transactional
    public void markTaskAsDelivered(int taskId) {
        VolunteerTask task = hibernateTemplate.get(VolunteerTask.class, taskId);
        if (task != null && "Accepted".equalsIgnoreCase(task.getStatus())) {
            task.setStatus("Delivered");
            hibernateTemplate.update(task);
        }
    }

    @SuppressWarnings("unchecked")
    public List<VolunteerTask> getTasksByVolunteer(int volunteerId) {
        String hql = "FROM VolunteerTask vt WHERE vt.volunteer.id = :volunteerId";
        return (List<VolunteerTask>) hibernateTemplate.findByNamedParam(hql, "volunteerId", volunteerId);
    }
 // VolunteerTaskDao.java
    @SuppressWarnings("unchecked")
    public List<VolunteerTask> getTaskHistoryByVolunteer(int volunteerId) {
        String hql = "FROM VolunteerTask vt WHERE vt.volunteer.id = :volunteerId AND vt.status IN ('Accepted', 'Delivered')";
        return (List<VolunteerTask>) hibernateTemplate.findByNamedParam(hql, "volunteerId", volunteerId);
    }
    
    @PersistenceContext
    private EntityManager entityManager;

    public List<Donation> getDonationsByMonthAndYear(int month, int year) {
        String jpql = "SELECT d FROM Donation d WHERE FUNCTION('MONTH', d.donatedOn) = :month AND FUNCTION('YEAR', d.donatedOn) = :year";
        TypedQuery<Donation> query = entityManager.createQuery(jpql, Donation.class);
        query.setParameter("month", month);
        query.setParameter("year", year);
        return query.getResultList();
    }
//Password change of Admin 
    @Transactional
    public void updateAdminPassword(int adminId, String newPassword) {
        Admin admin = hibernateTemplate.get(Admin.class, adminId);
        if (admin != null) {
            admin.setPassword(newPassword);
            hibernateTemplate.update(admin);
        }
    }

//Change password for NGo
    @Transactional
    public void updateNgoPassword(int ngoId, String newPassword) {
        Ngo ngo = hibernateTemplate.get(Ngo.class, ngoId);
        if (ngo != null) {
            ngo.setPassword(newPassword);
            hibernateTemplate.update(ngo);
        }
    }
    
  //Change password for Donors
    
    @Transactional
    public void updateDonorPassword(int donorId, String newPassword) {
        Donor donor = hibernateTemplate.get(Donor.class, donorId);
        if (donor != null) {
            donor.setPassword(newPassword);
            hibernateTemplate.update(donor);
        }
    }
 //chnage Password for Volunteer 
    @Transactional
    public void updateVolunteerPassword(int volunteerId, String newPassword) {
        Volunteer volunteer = hibernateTemplate.get(Volunteer.class, volunteerId);
        if (volunteer != null) {
            volunteer.setPassword(newPassword);
            hibernateTemplate.update(volunteer);
        }
    }


}
