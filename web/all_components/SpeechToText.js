document.addEventListener('DOMContentLoaded', () => {
    const clickToConvert = document.getElementById('click_to_convert');
    const convertText = document.getElementById('convertText');

    if (clickToConvert && convertText) {
        clickToConvert.addEventListener('click', () => {
            // Ensure Speech Recognition is available
            const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
            if (!SpeechRecognition) {
                console.error('Speech Recognition API is not supported in this browser.');
                return;
            }

            const recognition = new SpeechRecognition();
            recognition.interimResults = true;
            recognition.continuous = false;

            recognition.addEventListener('result', (e) => {
                const transcript = Array.from(e.results)
                    .map((result) => result[0])
                    .map((result) => result.transcript)
                    .join('');

                // Check if convertText exists before updating
                const convertTextElement = document.getElementById('convertText');
                if (convertTextElement) {
                    convertTextElement.textContent = transcript; // Use textContent for safety
                } else {
                    console.error("Element with ID 'convertText' not found during recognition.");
                }
            });

            recognition.addEventListener('error', (err) => {
                console.error('Speech Recognition Error:', err);
            });

            recognition.start();
        });
    } else {
        if (!clickToConvert) {
            console.error("Element with ID 'click_to_convert' not found.");
        }
        if (!convertText) {
            console.error("Element with ID 'convertText' not found.");
        }
    }
});
