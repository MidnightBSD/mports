PORTNAME=	libpafe-ruby
PORTVERSION=	0.0.8
PORTREVISION=	1
CATEGORIES=	devel ruby
MASTER_SITES=	http://homepage3.nifty.com/slokar/pasori/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding for libpafe
WWW=		http://homepage3.nifty.com/slokar/pasori/libpafe-ruby.html

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpafe.so:devel/libpafe

USES=	ruby:extconf

PLIST_FILES=	%%RUBY_SITEARCHLIBDIR%%/pasori.so

WRKSRC=		${WRKDIR}/${PORTNAME}

pre-install:
	@${MKDIR} ${STAGEDIR}${RUBY_SITEARCHLIBDIR}

.include <bsd.port.mk>
