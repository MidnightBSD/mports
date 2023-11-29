PORTNAME=	freebsd-telnetd
DISTVERSIONPREFIX=	v
DISTVERSION=	14.0.5
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FreeBSD telnetd
WWW=		https://github.com/cschuber/freebsd-telnetd

LICENSE=	bsd3

USE_GITHUB=	yes
GH_ACCOUNT=	cschuber
GH_PROJECT=	freebsd-telnet

USES=		uidfix

MAKE_ARGS+=		BINOWN=${BINOWN} BINMODE=${BINMODE}
MAKE_ENV+=		MAKESYSPATH=/usr/src/share/mk \
			BINDIR=${PREFIX}/libexec \
			MANDIR=${PREFIX}/man/man \
			TELNETDIR=${WRKSRC}/contrib/telnet

OPTIONS_DEFINE=		IPV6
OPTIONS_DEFAULT=	IPV6

# WRKSRC_SUBDIR=		libexec/telnetd

.include <bsd.mport.options.mk>

MAKE_ENV+=	NO_WERROR=1

post-patch:
	@${CP} ${FILESDIR}/Makefile.in ${WRKSRC}/Makefile

post-install:
	@${INSTALL_DATA} ${WRKSRC}/lib/libpam/pam.d/telnetd ${PREFIX}/etc/pam.d/telnetd.default

.include <bsd.port.mk>
