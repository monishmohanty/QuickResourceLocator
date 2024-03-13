import React from 'react';
import './ContentSection.css';

const ContentSection = ({ title, children }) => {
  return (
    <div className="content-section">
      <h2>{title}</h2>
      {children}
    </div>
  );
};

export default ContentSection;
