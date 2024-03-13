import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'; // Import Bootstrap CSS at the top level if not already imported

const Contact = () => {
  return (
    <div className="container mt-5">
      <div className="text-center mb-4">
        <h2 className="mb-3">Need more support?</h2>
        <button className="btn btn-primary">Dell Support</button>
      </div>
      <div className="row justify-content-center">
        <div className="col-md-4 mb-3">
          <div className="card h-100">
            <div className="card-body text-center">
              <h3 className="card-title">United States Customers</h3>
              <p className="card-text">In Warranty Support</p>
              <p className="card-text">Basic Support</p>
              <button className="btn btn-primary">1 (800) 624-9896</button>
            </div>
          </div>
        </div>
        <div className="col-md-4 mb-3">
          <div className="card h-100">
            <div className="card-body text-center">
              <h3 className="card-title">United States Customers</h3>
              <p className="card-text">Out of Warranty Support</p>
              <p className="card-text">Basic Support</p>
              <button className="btn btn-primary">1 (800) 288-4410</button>
            </div>
          </div>
        </div>
        <div className="col-md-4 mb-3">
          <div className="card h-100">
            <div className="card-body text-center">
              <h3 className="card-title">Outside the United States</h3>
              <p className="card-text">Availability varies by country and product. Some services may not be available in your area. To contact Dell for sales, technical support, or customer service issues:</p>
              <button className="btn btn-primary">Dell Support</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Contact;
