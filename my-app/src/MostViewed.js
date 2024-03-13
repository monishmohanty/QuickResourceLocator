import React from 'react';
import './MostViewed.css'; // Make sure the CSS file is in the same directory

const MostViewed = () => {
  // Placeholder data - replace this with actual data retrieval logic
  const mostViewedItems = [
    { id: 1, name: 'Precision Tower 5820', category: 'Products' },
    { id: 2, name: 'Precision Tower 7920', category: 'Products' },
    { id: 3, name: 'Precision Tower 5810', category: 'Products' },
    // ... more items
  ];

  return (
    <div className="most-viewed">
      <h2>Most Viewed</h2>
      <ul>
        {mostViewedItems.map(item => (
          <li key={item.id} className="item">
            <span className="item-name">{item.name}</span>
            <span className="item-category">{item.category}</span>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default MostViewed;
