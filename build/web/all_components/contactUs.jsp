<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - ClickKart</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color:  #f4f4f4;
            color: #333;
        }

        header {
            background-color: #35424a;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .company-name {
            font-size: 2.5em;
            font-weight: bold;
            animation: pulse 2s infinite;
        }

        h1 {
            margin: 0;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.5s ease-in-out;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0 5px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
            outline: none;
        }

        button {
            margin-top: 10px;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:hover {
            background-color: #388E3C;
            transform: scale(1.05);
        }

        .contact-info,
        .service-centers {
            margin-top: 20px;
            padding: 15px;
            background-color: #f2f2f2;
            border-radius: 8px;
            animation: fadeIn 1s ease-in-out;
        }

        .service-center {
            margin-bottom: 15px;
        }

        footer {
            background-color: #35424a;
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

            button {
                font-size: 14px;
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
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="company-name">ClicKart</div>
        <h1>Contact Us</h1>
    </header>
    
    <main>
        <form action="submit-contact-form" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required placeholder="Your Name">
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required placeholder="Your Email">
            
            <label for="message">Message:</label>
            <textarea id="message" name="message" required placeholder="Your Message" rows="5"></textarea>
            
            <button type="submit">Submit</button>
        </form>
        
        <div class="contact-info">
            <h2>Contact Information</h2>
            <p><strong>Email:</strong> info@clickart.com</p>
            <p><strong>Phone:</strong> 555-1234</p>
        </div>
        
        <div class="service-centers">
            <h2>Nearby Service Centers</h2>
            <div class="service-center">
                <h3>Service Center 1</h3>
                <p><strong>Address:</strong> 123 Main St, Anytown USA</p>
                <p><strong>Phone:</strong> 555-5678</p>
            </div>
            <div class="service-center">
                <h3>Service Center 2</h3>
                <p><strong>Address:</strong> 456 Oak Ave, Somewhere City</p>
                <p><strong>Phone:</strong> 555-9012</p>
            </div>
        </div>
    </main>
    
    <footer>
        <p>&copy; 2024 ClickKart. All rights reserved.</p>
    </footer>
</body>
</html>