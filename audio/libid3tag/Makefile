PORTNAME=	libid3tag
DISTVERSION=	0.16.2
CATEGORIES=	audio
MASTER_SITES=	https://codeberg.org/tenacityteam/${PORTNAME}/archive/${DISTVERSIONFULL}${EXTRACT_SUFX}?dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ID3 tags library (part of MAD project)
WWW=		http://mad.sourceforge.net/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

USES=		cmake cpe pathfix
CPE_VENDOR=	libid3tag_project
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

.include <bsd.port.mk>
