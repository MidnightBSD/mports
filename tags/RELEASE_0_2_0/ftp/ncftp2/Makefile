# New ports collection makefile for:    ncftp2
# Date created:         4 Nov 1994
# Whom:                 ache
#
# $MidnightBSD: mports/ftp/ncftp2/Makefile,v 1.1 2007/04/02 00:39:06 laffer1 Exp $
# $FreeBSD: ports/ftp/ncftp2/Makefile,v 1.53 2007/02/09 08:37:01 rafan Exp $
#

PORTNAME=	ncftp
PORTVERSION=	2.4.3
PORTREVISION=	1
CATEGORIES=	ftp
MASTER_SITES=	ftp://ftp.ncftp.com/ncftp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FTP replacement with advanced user interface
LICENSE=	restricted

.if defined(INSTALL_AS_NCFTP)
LATEST_LINK=	ncftp
.else
LATEST_LINK=	ncftp2
.endif
PLIST_FILES=	bin/${LATEST_LINK}
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_func_getmaxyx=yes ac_cv_lib_readline=yes
MAN1=		ncftp2.1

.if defined(WITH_SOCKS)
BUILD_DEPENDS=	${LOCALBASE}/lib/libsocks5.a:${PORTSDIR}/net/socks5
CONFIGURE_ARGS+=--enable-socks5
.endif

pre-fetch:
	@${ECHO} ""
	@${ECHO} "Use INSTALL_AS_NCFTP=yes to install ncftp1 as ${PREFIX}/bin/ncftp"
	@${ECHO} ""

do-install:
	$(INSTALL_PROGRAM) $(WRKSRC)/ncftp $(PREFIX)/bin/${LATEST_LINK}
	$(INSTALL_MAN) $(WRKSRC)/ncftp.1 $(PREFIX)/man/man1/ncftp2.1

.include <bsd.port.mk>
