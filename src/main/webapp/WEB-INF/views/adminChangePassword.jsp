<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Change Password</title>
    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow border-0">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">Change Password</h4>
                </div>
                <div class="card-body">

                    <!-- Show Error -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <!-- Show Success -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-success">${message}</div>
                    </c:if>

                    <!-- Change Password Form -->
                    <form action="adminChangePassword" method="post">
                        <div class="form-group">
                            <label for="oldPassword">Old Password</label>
                            <input type="password" id="oldPassword" name="oldPassword" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="newPassword">New Password</label>
                            <input type="password" id="newPassword" name="newPassword" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-success btn-block">Change Password</button>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <a href="adminDashboard" class="btn btn-link">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap 4 JS + dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
