# Created by: Nikola Lecic <nikola.lecic@anthesphoria.net>


PORTNAME=	teckit
PORTVERSION=	2.5.1
CATEGORIES=	textproc converters
MASTER_SITES=	http://scripts.sil.org/svn-view/teckit/TAGS/ \
		http://anthesphoria.net/FreeBSD/ports/distfiles/
DISTNAME=	TECkit_${PORTVERSION:S|.|_|g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolkit for converting data between 8-bit legacy encodings and Unicode

LICENSE=	lgpl2.1

LIB_DEPENDS=	libexpat.so:${PORTSDIR}/textproc/expat2

USES=		libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

DOCS=		AUTHORS README NEWS docs/*.pdf license/LICENSING.txt

OPTIONS_DEFINE=	DOCS

post-patch:
	${CHMOD} ${BINMODE} ${WRKSRC}/configure ${WRKSRC}/install-sh

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${DOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

.include <bsd.port.mk>
