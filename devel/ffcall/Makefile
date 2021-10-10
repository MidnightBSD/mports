

PORTNAME=	ffcall
PORTVERSION=	1.10
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.santafe.edu/pub/gnu/ GNUSTEP/libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign function call libraries

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USES=		gmake libtool

CONFIGURE_TARGET=	${ARCH:S/amd64/x86_64/}-portbld-freebsd9.1
MAKE_JOBS_UNSAFE=	yes

CFLAGS+=	-fPIC

.include <bsd.port.mk>
