# New ports collection makefile for:    lynx
# Date created:         15 Dec 1994
# Whom:                 ache
#
# $MidnightBSD: mports/www/lynx/Makefile,v 1.5 2008/06/08 23:27:40 laffer1 Exp $
# $FreeBSD: ports/www/lynx/Makefile,v 1.114 2005/12/12 21:33:23 lawrance Exp $
#

PORTNAME=	lynx
PORTVERSION=	2.8.6
PORTREVISION=	1
CATEGORIES=	www ipv6
MASTER_SITES=	http://lynx.isc.org/current/ \
		ftp://lynx.isc.org/lynx2.8.6/patches/:patches
DISTNAME=	${PORTNAME}2.8.6rel.1

PATCH_SITES=	ftp://lynx.isc.org/lynx2.8.6/patches/
.for i in 2 3 4 5
PATCHFILES+=	2.8.6rel.${i}.patch.gz
.endfor
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A non-graphical, text-based World-Wide Web client
LICENSE=	gpl2

CONFLICTS?=	lynx-current*

USE_BZIP2=	yes
USE_OPENSSL=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}2-8-6
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-screen=ncurses --with-zlib --libdir="${L_LIB}" \
		--enable-nsl-fork --enable-persistent-cookies \
		--enable-ipv6 --with-ssl="${OPENSSLBASE}"

_FAKE_SETUP += DOCSDIR=${FAKE_DESTDIR}${DOCSDIR}
TARGET_DIR=	${DESTDIR}${PREFIX}

.if defined(ENABLE_DEFAULT_COLORS)
CONFIGURE_ARGS+=--enable-default-colors
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

.include <bsd.port.mk>
