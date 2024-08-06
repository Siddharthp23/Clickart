<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - ClicKart</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
            overflow-x: hidden; /* Prevent horizontal scroll */
        }

        header {
            background-color: #4CAF50;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            margin: 0;
            font-size: 2.5em;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.5s ease-in-out;
        }

        .achievement {
            margin: 20px 0;
            padding: 15px;
            background-color: #e8f5e9;
            border-left: 5px solid #4CAF50;
            border-radius: 4px;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s ease-in-out forwards;
        }

        .security-highlight {
            background-color: #ffe0b2;
            border-left: 5px solid #ff9800;
            padding: 15px;
            border-radius: 4px;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s ease-in-out forwards;
            animation-delay: 0.5s; /* Delay for emphasis */
        }

        footer {
            background-color: #4CAF50;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            animation: fadeIn 1s ease-in-out;
        }

        @media (max-width: 600px) {
            main {
                padding: 10px;
            }
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            from {
                transform: translateY(-30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>About Us</h1>
    </header>
    
    <main>
        <h2>Welcome to ClicKart</h2>
        <p>At ClicKart, we are dedicated to providing innovative solutions that empower businesses and enhance customer experiences. Our journey began with a vision to revolutionize the e-commerce landscape, and we have achieved remarkable milestones along the way.</p>

        <h2>Our Achievements</h2>
        <div class="achievement">
            <h3>1. Industry Leader</h3>
            <p>Recognized as one of the top e-commerce platforms in the region, serving millions of satisfied customers.</p>
        </div>
        <div class="achievement">
            <h3>2. Award-Winning Service</h3>
            <p>Recipient of the Best Customer Service Award for three consecutive years, showcasing our commitment to excellence.</p>
        </div>
        <div class="achievement">
            <h3>3. Innovative Technology</h3>
            <p>Developed cutting-edge technology that enhances user experience and streamlines online transactions.</p>
        </div>
        
        <div class="security-highlight">
            <h2>Our Security Division</h2>
            <p>At ClicKart, we prioritize the security of our customers' data. Our dedicated security division implements robust measures to protect sensitive information and ensure a safe shopping experience.</p>
            <p>We employ the latest encryption technologies, conduct regular security audits, and adhere to best practices in cybersecurity to safeguard our platform.</p>
        </div>
    </main>
    
    <footer>
        <p>&copy; 2024 ClicKart. All rights reserved.</p>
    </footer>
</body>
</html>