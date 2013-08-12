# $MidnightBSD$

PORTNAME=	giblib
PORTVERSION=	1.2.4
PORTREVISION=	6
CATEGORIES=	graphics devel
MASTER_SITES=	http://linuxbrit.co.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility library that includes a wrapper for imlib2

LICENSE=	other

LIB_DEPENDS=	Imlib2.5:${PORTSDIR}/graphics/imlib2

USES=	pathfix pkgconfig
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|: install-docsDATA|:|g' ${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog README TODO
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
