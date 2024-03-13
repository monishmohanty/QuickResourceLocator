import React from 'react';
import './Statistics.css';

const Statistics = ({ stats }) => {
  return (
    <div className="statistics">
      <div className="stat-item">{stats.products} Product Cataloged</div>
      <div className="stat-item">{stats.videos} Product Videos</div>
      <div className="stat-item">{stats.documents} Product Documents</div>
      <div className="stat-item">{stats.bookmarks} Bookmarks</div>
    </div>
  );
};

export default Statistics;
