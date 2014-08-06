# $MidnightBSD$

PORTNAME=	xinetd
PORTVERSION=	2.3.15
PORTREVISION=	1
CATEGORIES=	security ipv6
MASTER_SITES=	GENTOO/distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Replacement for inetd with better control and logging

LICENSE=	other

FAKE_OPTS=	prefixhack

USES=		gmake
GNU_CONFIGURE=	yes
USE_RC_SUBR=	xinetd
ALL_TARGET=	build
CONFIGURE_ARGS+=	--with-loadavg --with-libwrap --with-ipv6

post-patch:
	${FIND} ${WRKSRC}/libs/src -name Makefile.in | ${XARGS} \
		${REINPLACE_CMD} -e 's!\@INSTALL\@!/bin/cp!; s!-m 640!!'
	@${REINPLACE_CMD} 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/xinetd/xconfig.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xinetd/xinetd ${STAGEDIR}${PREFIX}/sbin/xinetd
	${INSTALL_SCRIPT} ${WRKSRC}/xinetd/xconv.pl ${STAGEDIR}${PREFIX}/bin/xconv
	${INSTALL_MAN} ${WRKSRC}/xinetd/xinetd.conf.man ${STAGEDIR}${PREFIX}/man/man5/xinetd.conf.5
	${INSTALL_MAN} ${WRKSRC}/xinetd/xconv.pl.8 ${STAGEDIR}${PREFIX}/man/man8/xconv.8
	${INSTALL_MAN} ${WRKSRC}/xinetd/xinetd.man ${STAGEDIR}${PREFIX}/man/man8/xinetd.8
	${INSTALL_MAN} ${WRKSRC}/xinetd/xinetd.log.man ${STAGEDIR}${PREFIX}/man/man8/xinetd.log.8

.include <bsd.port.mk>
