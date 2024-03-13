import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';
import './ProductDetails.css'; // Make sure to create this CSS file

const ProductDetails = () => {
  const { productId } = useParams();
  const [productVideos, setProductVideos] = useState([]);
  const [productDocuments, setProductDocuments] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchVideos = axios.get(`http://localhost:5000/api/products/${productId}/videos`);
    const fetchDocuments = axios.get(`http://localhost:5000/api/products/${productId}/documents`);

    Promise.all([fetchVideos, fetchDocuments])
      .then((results) => {
        const [videosResponse, documentsResponse] = results;
        setProductVideos(videosResponse.data);
        setProductDocuments(documentsResponse.data);
        setLoading(false);
      })
      .catch((error) => {
        console.error('Error fetching product details:', error);
        setLoading(false);
      });
  }, [productId]);

  if (loading) {
    return <div className="loading">Loading...</div>;
  }

  return (
    <div className="product-details">
      <h1>Product Details</h1>
      
      <section className="videos-section">
        <h2>Videos</h2>
        <div className="videos-container">
          {productVideos.map(video => (
            <div key={video.id} className="video-card">
              <a href={video.VIDEO_URL} target="_blank" rel="noopener noreferrer">
                <img src={video.VIDEO_THUMBNAIL_URL} alt={video.VIDEO_TITLE} />
                <p>{video.VIDEO_TITLE}</p>
              </a>
            </div>
          ))}
        </div>
      </section>
      
      <section className="documents-section">
        <h2>Documents</h2>
        <ul className="documents-list">
          {productDocuments.map(document => (
            <li key={document.id} className="document-item">
              <a href={document.DOC_PATH} target="_blank" rel="noopener noreferrer">
                {document.DOC_TITLE}
              </a>
            </li>
          ))}
        </ul>
      </section>
    </div>
  );
};

export default ProductDetails;
