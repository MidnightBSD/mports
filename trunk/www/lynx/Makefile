# New ports collection makefile for:    lynx
# Date created:         15 Dec 1994
# Whom:                 ache
#
# $MidnightBSD: mports/www/lynx/Makefile,v 1.6 2008/06/08 23:28:26 laffer1 Exp $
# $FreeBSD: ports/www/lynx/Makefile,v 1.114 2005/12/12 21:33:23 lawrance Exp $
#

PORTNAME=	lynx
PORTVERSION=	2.8.6.5
PORTREVISION=	0
CATEGORIES=	www ipv6
MASTER_SITES=	http://lynx.isc.org/current/ \
		ftp://lynx.isc.org/lynx2.8.6/patches/:patches
DISTNAME=	${PORTNAME}2.8.6rel.5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A non-graphical, text-based World-Wide Web client
LICENSE=	gpl2

CONFLICTS?=	lynx-current*

USE_BZIP2=	yes
USE_OPENSSL=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}2-8-6
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=--with-screen=ncurses --with-zlib --libdir="${L_LIB}" \
		--enable-nsl-fork --enable-persistent-cookies

_FAKE_SETUP += DOCSDIR=${FAKE_DESTDIR}${DOCSDIR}
TARGET_DIR=	${DESTDIR}${PREFIX}

OPTIONS=	SSL		"SSL Support" on \
		DEFAULT_COLORS "Colors Support" off \
		IPV6		"IPv6 Support" off

.include <bsd.port.pre.mk>

.if defined(WITH_DEFAULT_COLORS)
CONFIGURE_ARGS+=--enable-default-colors
.endif

.if defined(WITH_SSL)
CONFIGURE_ARGS+=	--with-ssl=${OPENSSLBASE}
.endif

.if defined(WITH_IPV6) && !defined(NO_INET6)
CONFIGURE_ARGS+=	--enable-ipv6
.endif

MAKE_ARGS=	helpdir=${L_HELP} docdir=${DOCSDIR}
MAKEFILE=	makefile
INSTALL_TARGET=	install-full
MAN1=		lynx.1

L_LIB=		${PREFIX}/etc
L_HELP=		${PREFIX}/share/lynx_help

post-patch:
	@${RM} -f ${WRKSRC}/CHANGES.orig

post-install:
	${INSTALL_DATA} ${WRKSRC}/samples/lynx.lss ${L_LIB}
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${L_HELP}
	${CHOWN} ${SHAREOWN}:${SHAREGRP} ${L_LIB}/lynx.cfg ${L_LIB}/lynx.lss

.include <bsd.port.post.mk>
