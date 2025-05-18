<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | Vehicle Parts WMS</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #2a3440;
            --secondary-color: #3d8bfd;
            --accent-color: #ff6b6b;
        }
        
        body {
            background: linear-gradient(rgba(40, 50, 60, 0.85), rgba(40, 50, 60, 0.85)),
                        url('img/view-3d-car-with-sketch-effect.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
        }
        
        .login-container {
            width: 100%;
            max-width: 420px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        
        .login-header {
            background: var(--primary-color);
            padding: 2rem;
            text-align: center;
            position: relative;
        }
        
        .login-header h2 {
            color: #fff;
            font-weight: 700;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            letter-spacing: 0.5px;
        }
        
        .login-header small {
            color: rgba(255,255,255,0.85);
            font-size: 0.95em;
            margin-top: 0.5rem;
            display: block;
        }
        
        .login-body {
            padding: 2rem;
            background: #ffffff;
        }
        
        .form-control {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 0.75rem 1.25rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 3px rgba(61, 139, 253, 0.15);
        }
        
        .btn-login {
            background: var(--secondary-color);
            color: white;
            padding: 0.75rem;
            font-weight: 600;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-login:hover {
            background: #2c7be5;
            transform: translateY(-1px);
        }
        
        .forgot-password {
            color: #6c757d !important;
            transition: color 0.3s ease;
        }
        
        .forgot-password:hover {
            color: var(--primary-color) !important;
        }
        
        .background-credit {
            position: fixed;
            bottom: 10px;
            right: 10px;
            color: rgba(255,255,255,0.7);
            font-size: 0.8em;
            text-shadow: 0 1px 2px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <div class="background-credit">
        Photo by Automotive Photographer
    </div>

    <div class="login-container">
        <div class="login-header">
            <h2>VEHICLE PARTS WMS</h2>
            <small>Warehouse Management System</small>
        </div>
        
        <div class="login-body">
            <form action="loginServlet" method="POST">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" 
                           class="form-control" 
                           id="username" 
                           name="username" 
                           placeholder="Enter your username" 
                           required>
                </div>
                
                <div class="mb-4">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" 
                           class="form-control" 
                           id="password" 
                           name="password" 
                           placeholder="••••••••" 
                           required>
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-login">SIGN IN</button>
                </div>
                
                <div class="mt-3 text-center">
                    
                    
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
