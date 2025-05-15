<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manager Dashboard | Vehicle Parts WMS</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
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
            transition: transform 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
        }
        
        .alert-badge {
            position: absolute;
            right: -10px;
            top: -10px;
        }
        
        .nav-link {
            color: rgba(255,255,255,0.8);
            transition: all 0.3s ease;
        }
        
        .nav-link:hover {
            color: white;
            background: rgba(255,255,255,0.1);
        }
        
        .chart-container {
            background: white;
            border-radius: 10px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            <a class="nav-link active" href="#"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
            <a class="nav-link" href="#"><i class="fas fa-boxes me-2"></i>Inventory</a>
            <a class="nav-link" href="#"><i class="fas fa-shipping-fast me-2"></i>Orders</a>
            <a class="nav-link" href="#"><i class="fas fa-users me-2"></i>Staff Management</a>
            <a class="nav-link" href="#"><i class="fas fa-chart-bar me-2"></i>Reports</a>
            <a class="nav-link" href="#"><i class="fas fa-cog me-2"></i>Settings</a>
        </nav>
    </div>

    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Dashboard Overview</h3>
            <div class="d-flex align-items-center">
                <span class="me-3">Welcome, Manager</span>
                <button class="btn btn-sm btn-secondary"><i class="fas fa-sign-out-alt"></i></button>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="row g-4 mb-4">
            <div class="col-md-3">
                <div class="stat-card">
                    <h6 class="text-muted">Total Revenue</h6>
                    <h3>$45,230</h3>
                    <small class="text-success"><i class="fas fa-arrow-up"></i> 12% from last month</small>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <h6 class="text-muted">Total Orders</h6>
                    <h3>1,234</h3>
                    <small class="text-warning"><i class="fas fa-box"></i> 15 pending</small>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <h6 class="text-muted">Today's Income</h6>
                    <h3>$2,340</h3>
                    <small class="text-success"><i class="fas fa-arrow-up"></i> 8% from yesterday</small>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card position-relative">
                    <span class="badge bg-danger alert-badge">3</span>
                    <h6 class="text-muted">Stock Alerts</h6>
                    <h3>12 Items</h3>
                    <small class="text-danger"><i class="fas fa-exclamation-triangle"></i> Low stock</small>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="row g-4">
            <!-- Left Column -->
            <div class="col-md-8">
                <!-- Stock Alerts -->
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Stock Alerts</h5>
                        <a href="#" class="btn btn-sm btn-outline-primary">Reorder Stock</a>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Part Name</th>
                                    <th>Current Stock</th>
                                    <th>Min Level</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Turbo Charger X1</td>
                                    <td class="text-danger">5</td>
                                    <td>20</td>
                                    <td><button class="btn btn-sm btn-warning">Reorder</button></td>
                                </tr>
                                <!-- More rows -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Recent Orders -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Recent Orders</h5>
                    </div>
                    <div class="card-body">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Search orders...">
                            <button class="btn btn-outline-secondary" type="button"><i class="fas fa-search"></i></button>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Customer</th>
                                        <th>Status</th>
                                        <th>Total</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#1234</td>
                                        <td>John Doe</td>
                                        <td><span class="badge bg-warning">Pending</span></td>
                                        <td>$450</td>
                                        <td><button class="btn btn-sm btn-success">Mark Shipped</button></td>
                                    </tr>
                                    <!-- More rows -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="col-md-4">
                <!-- Quick Actions -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h5 class="mb-0">Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary"><i class="fas fa-plus me-2"></i>New Staff</button>
                            <button class="btn btn-success"><i class="fas fa-file-excel me-2"></i>Generate Report</button>
                            <button class="btn btn-info"><i class="fas fa-box me-2"></i>Inventory Check</button>
                        </div>
                    </div>
                </div>

                <!-- Stock Chart -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Stock Levels</h5>
                    </div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="stockChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- Custom Scripts -->
    <script>
        // Stock Chart
        const ctx = document.getElementById('stockChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Turbo Chargers', 'Exhaust Systems', 'Suspension Kits', 'ECU Units'],
                datasets: [{
                    label: 'Current Stock',
                    data: [15, 30, 45, 22],
                    backgroundColor: '#3498db'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    </script>
</body>
</html>