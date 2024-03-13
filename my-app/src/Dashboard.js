import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import Cookies from 'js-cookie';
import SearchBar from './SearchBar';
import ContentSection from './ContentSection';
import Statistics from './Statistics';
import './Dashboard.css';
import 'bootstrap/dist/css/bootstrap.min.css';

const Dashboard = () => {
  const navigate = useNavigate();
  const [mostViewed, setMostViewed] = useState([]);
  const [bookmarks, setBookmarks] = useState([]);
  const [stats, setStats] = useState({
    products: 0,
    videos: 0,
    documents: 0,
    bookmarks: 0,
  });
  const [visited, setVisited] = useState(false);

  useEffect(() => {
    // Check if the 'visitedDashboard' cookie exists
    const visitedDashboard = Cookies.get('visitedDashboard');

    if (visitedDashboard) {
      setVisited(true);
    } else {
      // Set the cookie if not present
      Cookies.set('visitedDashboard', 'true', { expires: 7 }); // Expires in 7 days
    }

    // Fetch most viewed products
    axios.get('http://localhost:5000/api/most-viewed-products')
      .then(response => setMostViewed(response.data))
      .catch(error => console.error('Error fetching most viewed products:', error));

    // Fetch bookmarked products
    axios.get('http://localhost:5000/api/bookmarked-products')
      .then(response => setBookmarks(response.data))
      .catch(error => console.error('Error fetching bookmarked products:', error));

    // Fetch statistics for products, videos, documents, and bookmarks
    axios.get('http://localhost:5000/api/stats')
      .then(response => setStats(response.data))
      .catch(error => console.error('Error fetching statistics:', error));
  }, []);

  const handleSearch = searchTerm => {
    axios.get(`http://localhost:5000/api/products/search`, { params: { q: searchTerm } })
      .then(response => navigate('/search-results', { state: { results: response.data } }))
      .catch(error => console.error('Error during search:', error));
  };

  // Function to render product items with image
  const renderProductItem = (product) => (
    <div key={product.PRODUCT_ID} className="product-item" onClick={() => navigate(`/product-details/${product.PRODUCT_ID}`)}>
      <img src={product.PRODUCT_THUMBNAIL_URL} alt={product.PRODUCT_DISPLAY_NAME} className="product-thumbnail" />
      <span className="product-name">{product.PRODUCT_DISPLAY_NAME}</span>
    </div>
  );

  return (
    <div className="dashboard">
      {/* {visited && (
        <div className="alert alert-info">
          Welcome back! It's great to see you again.
        </div>
      )} */}
      <div className="search-container">
        <SearchBar onSearch={handleSearch} />
      </div>
      <div className="dashboard-content">
        <ContentSection title="Most Viewed">
          <div className="product-list">
            {mostViewed.map(renderProductItem)}
          </div>
        </ContentSection>
        <ContentSection title="Recent Bookmarks">
          <div className="product-list">
            {bookmarks.map(renderProductItem)}
          </div>
        </ContentSection>
        <Statistics stats={stats} />
      </div>
    </div>
  );
};

export default Dashboard;
