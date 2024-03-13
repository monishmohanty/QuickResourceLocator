// import React from 'react';
// import './RecentBookmarks.css'; // Make sure the CSS file is in the same directory

// const RecentBookmarks = () => {
//   // Placeholder data - replace this with actual data retrieval logic
//   const bookmarks = [
//     // { id: 1, name: 'Some Product', category: 'Products' },
//     // You can uncomment and add more items or fetch from an API
//   ];

//   return (
//     <div className="recent-bookmarks">
//       <h2>Recent Bookmarks</h2>
//       <ul>
//         {bookmarks.length > 0 ? (
//           bookmarks.map((bookmark) => (
//             <li key={bookmark.id} className="bookmark-item">
//               <span className="bookmark-name">{bookmark.name}</span>
//               <span className="bookmark-category">{bookmark.category}</span>
//             </li>
//           ))
//         ) : (
//           <p className="no-bookmarks">No Bookmarks</p>
//         )}
//       </ul>
//     </div>
//   );
// };

// export default RecentBookmarks;
import React from 'react';
import { useNavigate } from 'react-router-dom'; // Import useNavigate hook
import './RecentBookmarks.css';

const RecentBookmarks = ({ bookmarks }) => {
  const navigate = useNavigate(); // Hook to navigate programmatically

  // Function to navigate to the Browse section
  const handleBrowseClick = () => {
    navigate('/browse'); // Adjust the path as necessary for your routing setup
  };

  return (
    <div className="recent-bookmarks">
      <h2>Recent Bookmarks</h2>
      {bookmarks && bookmarks.length > 0 ? (
        <ul>
          {bookmarks.map((bookmark) => (
            <li key={bookmark.id}>{bookmark.name}</li>
          ))}
        </ul>
      ) : (
        <div>
          <p>No Bookmarks</p>
          <button onClick={handleBrowseClick} className="browse-button">
            Browse Products
          </button>
        </div>
      )}
    </div>
  );
};

export default RecentBookmarks;
