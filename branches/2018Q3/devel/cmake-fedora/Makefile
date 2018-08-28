# $MidnightBSD$

PORTNAME=	cmake-fedora
PORTVERSION=	2.3.4
CATEGORIES=	devel
MASTER_SITES=	https://fedorahosted.org/releases/c/m/cmake-fedora/
DISTNAME=	${PORTNAME}-${PORTVERSION}-modules-only

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of cmake modules for fedora developers
LICENSE=	bsd3

WRKSRC=		${WRKDIR}/Modules
NO_BUILD=	yes
REINPLACE_ARGS=	-i ''

post-patch:
	@${REINPLACE_CMD} -e 's|-printf .*$$|-exec basename "{}" ";"|' \
		${WRKSRC}/ManageTranslation.cmake

do-install:
	${MKDIR} ${PREFIX}/share/cmake/Modules
	cd ${WRKSRC}/ && \
		${INSTALL_DATA} * ${PREFIX}/share/cmake/Modules

.include <bsd.port.mk>
