from extensions import db

class QRLLanguage(db.Model):
    __tablename__ = 'QRLLanguage'
    LANGUAGE_ID = db.Column(db.Integer, primary_key=True)
    LanguageCode = db.Column(db.String(10))
    LanguageName = db.Column(db.String(50))
    CreateDate = db.Column(db.DateTime, server_default=db.func.now())
    CreateBy = db.Column(db.String(250), server_default=db.func.current_user())
    UpdateDate = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())
    UpdateBy = db.Column(db.String(250), server_default=db.func.current_user())

    def to_dict(self):
        return {
            'LANGUAGE_ID': self.LANGUAGE_ID,
            'LanguageCode': self.LanguageCode,
            'LanguageName': self.LanguageName,
            
        }

class QRLProductCategory(db.Model):
    __tablename__ = 'QRLProductCategory'
    CATEGORY_ID = db.Column(db.Integer, primary_key=True)
    CATEGORY_NAME = db.Column(db.String(200))
    CATEGORY_THUMBNAIL_URL = db.Column(db.String(200))
    CreateDate = db.Column(db.DateTime, server_default=db.func.now())
    CreateBy = db.Column(db.String(250), server_default=db.func.current_user())
    UpdateDate = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())
    UpdateBy = db.Column(db.String(250), server_default=db.func.current_user())

    def to_dict(self):
        return {
            'CATEGORY_ID': self.CATEGORY_ID,
            'CATEGORY_NAME': self.CATEGORY_NAME,
            'CATEGORY_THUMBNAIL_URL': self.CATEGORY_THUMBNAIL_URL,
            
        }

class QRLProduct(db.Model):
    __tablename__ = 'QRLProduct'
    PRODUCT_ID = db.Column(db.Integer, primary_key=True)
    PRODUCT_DISPLAY_NAME = db.Column(db.String(200))
    CATEGORY_ID = db.Column(db.Integer, db.ForeignKey('QRLProductCategory.CATEGORY_ID'))
    PRODUCT_THUMBNAIL_URL = db.Column(db.String(200))
    CreateDate = db.Column(db.DateTime, server_default=db.func.now())
    CreateBy = db.Column(db.String(250), server_default=db.func.current_user())
    UpdateDate = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())
    UpdateBy = db.Column(db.String(250), server_default=db.func.current_user())
    BOOKMARK = db.Column(db.Integer)
    HITS = db.Column(db.Integer)

    category = db.relationship('QRLProductCategory', backref='products')

    def to_dict(self):
        return {
            'PRODUCT_ID': self.PRODUCT_ID,
            'PRODUCT_DISPLAY_NAME': self.PRODUCT_DISPLAY_NAME,
            'CATEGORY_ID': self.CATEGORY_ID,
            'PRODUCT_THUMBNAIL_URL': self.PRODUCT_THUMBNAIL_URL,
            'BOOKMARK': self.BOOKMARK,
            'HITS': self.HITS,
            'Category': self.category.to_dict() if self.category else None
        }

class QRLVideo(db.Model):
    __tablename__ = 'QRLVideo'
    id = db.Column(db.Integer, primary_key=True)
    PRODUCT_ID = db.Column(db.Integer, db.ForeignKey('QRLProduct.PRODUCT_ID'))
    LANGUAGE_ID = db.Column(db.Integer, db.ForeignKey('QRLLanguage.LANGUAGE_ID'))
    VIDEO_TITLE = db.Column(db.String(200))
    VIDEO_THUMBNAIL_URL = db.Column(db.String(1000))
    VIDEO_URL = db.Column(db.String(100))
    HITS = db.Column(db.Integer)
    CreateDate = db.Column(db.DateTime, server_default=db.func.now())
    CreateBy = db.Column(db.String(250), server_default=db.func.current_user())
    UpdateDate = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())
    UpdateBy = db.Column(db.String(250), server_default=db.func.current_user())
    BOOKMARK = db.Column(db.Integer)

    product = db.relationship('QRLProduct', backref='videos')
    language = db.relationship('QRLLanguage', backref='videos')

    def to_dict(self):
        return {
            'id': self.id,
            'PRODUCT_ID': self.PRODUCT_ID,
            'LANGUAGE_ID': self.LANGUAGE_ID,
            'VIDEO_TITLE': self.VIDEO_TITLE,
            'VIDEO_THUMBNAIL_URL': self.VIDEO_THUMBNAIL_URL,
            'VIDEO_URL': self.VIDEO_URL,
            'HITS': self.HITS,
            'BOOKMARK': self.BOOKMARK,
            
            'Product': self.product.to_dict() if self.product else None,
            'Language': self.language.to_dict() if self.language else None
        }
        
class QRLDocument(db.Model):
    __tablename__ = 'QRLDocument'
    id = db.Column(db.Integer, primary_key=True)  # Changed from DOCUMENT_ID
    PRODUCT_ID = db.Column(db.Integer, db.ForeignKey('QRLProduct.PRODUCT_ID'))
    LANGUAGE_ID = db.Column(db.Integer, db.ForeignKey('QRLLanguage.LANGUAGE_ID'))
    DOC_TITLE = db.Column(db.String(200))  # Changed from DOCUMENT_TITLE
    DOC_PATH = db.Column(db.String(1000))  # Changed from DOCUMENT_URL
    HITS = db.Column(db.Integer)
    CreateDate = db.Column(db.DateTime, server_default=db.func.now())
    CreateBy = db.Column(db.String(250), server_default=db.func.current_user())
    UpdateDate = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())
    UpdateBy = db.Column(db.String(250), server_default=db.func.current_user())
    BOOKMARK = db.Column(db.Integer)

    product = db.relationship('QRLProduct', backref='documents')
    language = db.relationship('QRLLanguage', backref='documents')

    def to_dict(self):
        return {
            'id': self.id,
            'PRODUCT_ID': self.PRODUCT_ID,
            'LANGUAGE_ID': self.LANGUAGE_ID,
            'DOC_TITLE': self.DOC_TITLE,
            'DOC_PATH': self.DOC_PATH,
            'HITS': self.HITS,
            'BOOKMARK': self.BOOKMARK,
            
            'Product': self.product.to_dict() if self.product else None,
            'Language': self.language.to_dict() if self.language else None
        }

