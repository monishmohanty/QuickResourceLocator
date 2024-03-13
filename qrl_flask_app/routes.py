from flask import jsonify, request, abort
from models import QRLLanguage, QRLProductCategory, QRLProduct, QRLVideo, QRLDocument
from extensions import db

def initialize_routes(app):

    @app.route('/api/languages', methods=['GET'])
    def get_languages():
        languages = QRLLanguage.query.all()
        return jsonify([language.to_dict() for language in languages])

    @app.route('/api/product-categories', methods=['GET'])
    def get_product_categories():
        categories = QRLProductCategory.query.all()
        return jsonify([category.to_dict() for category in categories])

    @app.route('/api/products', methods=['GET'])
    def get_products():
        products = QRLProduct.query.all()
        return jsonify([product.to_dict() for product in products])

    @app.route('/api/products/<int:product_id>', methods=['GET'])
    def get_product(product_id):
        product = QRLProduct.query.get_or_404(product_id)
        return jsonify(product.to_dict())

    @app.route('/api/products/search', methods=['GET'])
    def search_products():
        query = request.args.get('q', '')
        products = QRLProduct.query.filter(QRLProduct.PRODUCT_DISPLAY_NAME.contains(query)).all()
        return jsonify([product.to_dict() for product in products])

    @app.route('/api/product-categories/<int:category_id>/products', methods=['GET'])
    def get_category_products(category_id):
        category = QRLProductCategory.query.get_or_404(category_id)
        products = category.products
        return jsonify([product.to_dict() for product in products])



    @app.route('/api/bookmarked-products', methods=['GET'])
    def get_bookmarked_products():
        bookmarked_products = QRLProduct.query.filter(QRLProduct.BOOKMARK.isnot(None)).all()
        return jsonify([product.to_dict() for product in bookmarked_products])
    
    @app.route('/api/products/<int:product_id>/videos', methods=['GET'])
    def get_product_videos(product_id):
        product = QRLProduct.query.get(product_id)
        if product is None:
            return jsonify({'error': 'Product not found'}), 404

        videos = QRLVideo.query.filter_by(PRODUCT_ID=product_id).all()
        video_data = [
            {
                'VIDEO_TITLE': video.VIDEO_TITLE,
                'VIDEO_URL': video.VIDEO_URL,
                'VIDEO_THUMBNAIL_URL': video.VIDEO_THUMBNAIL_URL  
            }
            for video in videos
        ]
        return jsonify(video_data)

    @app.route('/api/products/<int:product_id>/documents', methods=['GET'])
    def get_product_documents(product_id):
        product = QRLProduct.query.get(product_id)
        if product is None:
            return jsonify({'error': 'Product not found'}), 404

        documents = QRLDocument.query.filter_by(PRODUCT_ID=product_id).all()
        document_data = [{'DOC_TITLE': document.DOC_TITLE, 'DOC_PATH': document.DOC_PATH} for document in documents]
        return jsonify(document_data)
    
    
    @app.route('/api/products/<int:product_id>/hit', methods=['POST'])
    def increment_hit(product_id):
        product = QRLProduct.query.get_or_404(product_id)
        if product.HITS is None:
            product.HITS = 0
        product.HITS += 1
        db.session.commit()
        return jsonify({'message': 'Hit incremented', 'total_hits': product.HITS})

    @app.route('/api/products/<int:product_id>/bookmark', methods=['POST'])
    def bookmark_product(product_id):
        product = QRLProduct.query.get_or_404(product_id)
        if product.BOOKMARK is None:
            product.BOOKMARK = 0
        product.BOOKMARK += 1
        db.session.commit()
        return jsonify({'message': 'Product bookmarked', 'total_bookmarks': product.BOOKMARK})
    
    @app.route('/api/most-viewed-products', methods=['GET'])
    def get_most_viewed_products():
        most_viewed_products = QRLProduct.query.order_by(QRLProduct.HITS.desc()).limit(3).all()
        return jsonify([product.to_dict() for product in most_viewed_products])

    @app.route('/api/stats', methods=['GET'])
    def get_stats():
        products_count = QRLProduct.query.count()
        videos_count = QRLVideo.query.count()
        documents_count = QRLDocument.query.count()
        bookmarks_count = QRLProduct.query.filter(QRLProduct.BOOKMARK.isnot(None)).count()

        return jsonify({
            'products': products_count,
            'videos': videos_count,
            'documents': documents_count,
            'bookmarks': bookmarks_count
        })
        
        
    @app.route('/api/product-categories/search', methods=['GET'])
    def search_product_categories():
        query = request.args.get('q', '')
        categories = QRLProductCategory.query.filter(QRLProductCategory.CATEGORY_NAME.contains(query)).all()
        return jsonify([category.to_dict() for category in categories])



   