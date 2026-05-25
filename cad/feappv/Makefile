PORTNAME=	feappv
DISTVERSIONPREFIX=v
DISTVERSION=	5.1.2e
CATEGORIES=	cad education science

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Finite element analysis program (personal version)
WWW=		http://projects.ce.berkeley.edu/feap/feappv/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		fortran gmake localbase:ldflags xorg

USE_GITHUB=	yes
GH_ACCOUNT=	sanjayg0

BINARY_ALIAS=	make=${GMAKE}
USE_XORG=	x11
MAKEFILE=	makefile
MAKE_ENV=	FEAPPVHOME5_1="${WRKSRC}"
ALL_TARGET=	install

LDFLAGS+=	-lX11 -lm

PLIST_FILES=	bin/feappv lib/libfeappv.a
PORTDOCS=	igaman_51.pdf manual_51.pdf

OPTIONS_DEFINE=	DOCS

pre-configure:
	${REINPLACE_CMD} -e \
		'/^  FF /s|=.*|= ${FC}| ; \
		 /^  CC /s|=.*|= ${CC}| ; \
		 /^  FFOPTFLAG /s|=.*|= ${FFLAGS}| ; \
		 /^  CCOPTFLAG /s|=.*|= ${CFLAGS}| ; \
		 /^  LDOPTIONS /s|=.*|= ${LDFLAGS}| ; \
		 s|Feappv_g.a|libfeappv.a|' ${WRKSRC}/makefile.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/main/feappv ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/libfeappv.a ${PREFIX}/lib

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${FAKE_DESTDIR}${WRKSRC}/manual/*.pdf ${DOCSDIR}

.include <bsd.port.mk>
