PORTNAME=	pdnmesh
PORTVERSION=	0.2.2
PORTREVISION=	24
CATEGORIES=	cad
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-source/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mesh generator and solver for Finite Element problems
WWW=		https://pdnmesh.sourceforge.net/

LICENSE=	gpl2+

LIB_DEPENDS=	libgtkglext-x11-1.0.so:x11-toolkits/gtkglext

OPTIONS_DEFINE=	ATLAS DOCS EXAMPLES
ATLAS_DESC=	Enable ATLAS support

USES=		compiler:c++11-lang fortran gl gnome pkgconfig
USE_GL=		glu
USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
LDFLAGS+=	-lm

DESKTOP_ENTRIES="pdnMesh" "${COMMENT}" "" "${PORTNAME}" "" true

ATLAS_USES=		blaslapack:atlas
ATLAS_CONFIGURE_ON=--with-blas=cblas --with-lapack=alapack
ATLAS_USES_OFF=		blaslapack
ATLAS_CONFIGURE_OFF=--with-blas=blas --with-lapack=lapack

post-patch:
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s|doc|| ; \
		 /^SUBDIRS/s|debian|| ; \
		 s|^pkgdata_DATA|#pkgdata_DATA|' ${WRKSRC}/Makefile.in

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} \
		&& ${INSTALL_DATA} ChangeLog ${FAKE_DESTDIR}${DOCSDIR} \
		&& ${INSTALL_DATA} README ${FAKE_DESTDIR}${DOCSDIR})
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/tutorial
	(cd ${WRKSRC}/doc/tutorial \
		&& ${INSTALL_DATA} README ${FAKE_DESTDIR}${DOCSDIR}/tutorial \
		&& ${INSTALL_DATA} tutorial.* ${FAKE_DESTDIR}${DOCSDIR}/tutorial)
post-install-EXAMPLES-on:
	(cd ${WRKSRC}/doc/examples && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR})
	${RM} ${FAKE_DESTDIR}${EXAMPLESDIR}/Makefile*

.include <bsd.port.mk>
