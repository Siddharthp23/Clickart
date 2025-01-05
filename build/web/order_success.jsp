<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>

    <!-- Link to Animate.css for predefined animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <!-- GSAP for advanced animations -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>

    <!-- Styling -->
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(120deg, #6a11cb, #2575fc);
            color: #fff;
            overflow: hidden;
        }

        .message-container {
            text-align: center;
        }

        .message {
            font-size: 3rem;
            margin: 20px 0;
        }

        .checkmark {
            width: 100px;
            height: 100px;
            margin: 0 auto;
        }

        .balloons {
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            pointer-events: none;
        }

        .balloon {
            width: 40px;
            height: 60px;
            position: absolute;
            bottom: -100px;
            background: red;
            border-radius: 50%;
            animation: float 5s infinite ease-in-out;
        }

        @keyframes float {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-300px);
            }
            100% {
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="message-container">
        <div class="checkmark animate__animated animate__bounceIn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                <circle cx="26" cy="26" r="25" fill="none" stroke="#fff" stroke-width="2"></circle>
                <path fill="none" stroke="#fff" stroke-width="2" d="M14 27l7 7 17-17"></path>
            </svg>
        </div>
        <div class="message animate__animated animate__fadeInUp">
            Order Successfully Placed!
        </div>
    </div>

    <!-- Balloons animation -->
    <div class="balloons">
        <div class="balloon" style="left: 10%; background: #ff3e96;"></div>
        <div class="balloon" style="left: 20%; background: #ffcc00; animation-delay: 0.5s;"></div>
        <div class="balloon" style="left: 30%; background: #1e90ff; animation-delay: 1s;"></div>
        <div class="balloon" style="left: 50%; background: #32cd32; animation-delay: 1.5s;"></div>
        <div class="balloon" style="left: 70%; background: #ff6347; animation-delay: 2s;"></div>
        <div class="balloon" style="left: 90%; background: #6a11cb; animation-delay: 2.5s;"></div>
    </div>

    <!-- GSAP Script for advanced animations -->
    <script>
        gsap.from(".message-container", { duration: 1.5, scale: 0, ease: "elastic" });
        gsap.to(".balloon", {
            y: "-120%",
            duration: 10,
            repeat: -1,
            ease: "linear",
            stagger: 0.5
        });
    </script>
</body>
</html>
