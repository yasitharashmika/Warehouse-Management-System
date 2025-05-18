<%@ page import="java.util.*, model.ReorderRequest, dao.ReorderRequestDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<ReorderRequest> reorderList = new ArrayList<>();
    int totalItems = 0;

    try {
        ReorderRequestDAO dao = new ReorderRequestDAO();
        reorderList = dao.getAllReorderRequests();
        totalItems = reorderList.size();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>New Stock List</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
        }
        
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        
        .sidebar {
            background-color: var(--primary-color);
            min-height: 100vh;
            color: white;
            width: 250px;
            position: fixed;
        }
        
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
        
        .table-responsive {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            padding: 20px;
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Staff</h4>
        <nav class="nav flex-column">
            <!-- Include your sidebar navigation items here -->
            <div class="sidebar-section">INVENTORY</div>
            <a class="nav-link" href="${pageContext.request.contextPath}/NewStockListServlet">
                <i class="fas fa-exclamation-triangle me-2"></i>New Stock List
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3><i class="fas fa-boxes me-2"></i>New Stock List</h3>
            <div class="d-flex align-items-center">
                <span class="me-3 text-muted">
                    <i class="fas fa-user-circle me-2"></i>
                    <%= session.getAttribute("username") %>
                </span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            </div>
        </div>

        <!-- Stats Card -->
        <div class="stat-card mb-4">
            <h5><i class="fas fa-cubes me-2"></i>Total Reorder Items</h5>
            <h2 class="mt-2"><%= totalItems %></h2>
            <small class="text-muted">Items needing restock</small>
        </div>

        <!-- Stock Table -->
        <div class="table-responsive">
            <table class="table table-hover table-striped">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Part Name</th>
                        <th>Quantity</th>
                        <th>Supplier Info</th>
                       
                        <th>Urgency</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (ReorderRequest r : reorderList) { %>
                    <tr>
                        <td><%= r.getId() %></td>
                        <td><%= r.getPartName() %></td>
                        <td><%= r.getQuantity() %></td>
                        <td><%= r.getSupplierInfo() %></td>
                        
                        <td><span class="badge bg-<%= r.getUrgency().equals("High") ? "danger" : "warning" %>">
                            <%= r.getUrgency() %>
                        </span></td>
                        <td>
                            <form method="post" action="DeleteReorderServlet" onsubmit="return confirm('Delete this item?');">
                                <input type="hidden" name="id" value="<%= r.getId() %>" />
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash-alt me-2"></i>Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>