<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Care</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
            animation: fadeIn 2s;
        }
        h2 {
            text-align: center;
            color: #00796b;
        }
        .section {
            margin-bottom: 25px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: #f1f8e9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: slideIn 1.5s;
        }
        .section h3 {
            margin-top: 0;
            color: #388e3c;
        }
        .submit-btn {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #00796b;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 18px;
            animation: growIn 2s;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .submit-btn:hover {
            background-color: #004d40;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideIn {
            from { transform: translateX(-100%); }
            to { transform: translateX(0); }
        }
        @keyframes growIn {
            from { transform: scale(0); }
            to { transform: scale(1); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer Care</h2>
        
        <div class="section">
            <h3>Frequently Asked Questions</h3>
            <ul>
                <li>How do I reset my password?</li>
                <li>Where can I view my purchase history?</li>
                <li>How do I contact customer service?</li>
                <li>Can I change my shipping address?</li>
            </ul>
        </div>
        
        <div class="section">
            <h3>Track My Order</h3>
            <form action="trackOrder.jsp" method="post">
                <label for="orderId">Order ID:</label>
                <input type="text" id="orderId" style="padding-top:2;" name="orderId" required>
                <button type="submit" class="submit-btn">Track Order</button>
            </form>
        </div>
        
        <div class="section">
            <h3>Payment Method Queries</h3>
            <ul>
                <li>What payment methods are accepted?</li>
                <li>How do I add a new payment method?</li>
                <li>Can I use multiple payment methods?</li>
                <li>Is my payment information secure?</li>
            </ul>
        </div>

        <button class="submit-btn">Submit</button>
    </div>
</body>
</html>
