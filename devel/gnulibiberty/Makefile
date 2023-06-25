PORTNAME=	gnulibiberty
PORTVERSION=	2.37
CATEGORIES=	devel
MASTER_SITES=	SOURCEWARE/binutils/releases
DISTNAME=	binutils-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Miscellaneous GNU functions

LICENSE=	gpl2 gpl3 lgpl3
LICENSE_COMB=	multi

WRKSRC=		${WRKDIR}/binutils-${PORTVERSION}/libiberty

USES=		gmake tar:xz

CONFIGURE_ARGS=	--enable-install-libiberty --disable-multilib
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
