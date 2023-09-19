PORTNAME=	freebsd-ftpd
DISTVERSIONPREFIX=	v
DISTVERSION=	20221002
CATEGORIES=	ftp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FreeBSD ftpd
WWW=		https://github.com/cschuber/freebsd-ftpd

LICENSE=	bsd3

USE_GITHUB=	yes
GH_ACCOUNT=	cschuber

USES=		uidfix

MAKE_ARGS+=		BINOWN=${BINOWN} BINMODE=${BINMODE}
MAKE_ENV+=		MAKESYSPATH=/usr/src/share/mk \
			BINDIR=${PREFIX}/libexec \
			MANDIR=${PREFIX}/man/man

OPTIONS_DEFINE=		IPV6 LIBBLACKLIST
OPTIONS_DEFAULT=	IPV6 LIBBLACKLIST
.if !exists(/usr/include/blacklist.h)
OPTIONS_EXCLUDE=	LIBBLACKLIST
.endif

LIBBLACKLIST_DESC=	libblacklist(3) support for rlogind(8) and rshd(8)
LIBBLACKLIST_MAKE_ARGS=	USE_LIBBLACKLIST=yes

.include <bsd.mport.options.mk>

MAKE_ENV+=	NO_WERROR=1

.include <bsd.port.mk>
