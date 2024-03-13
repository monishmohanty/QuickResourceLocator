import React from 'react';
import ReactDOM from 'react-dom/client';

import App from './App'; // No need for the .jsx extension and no curly braces

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
