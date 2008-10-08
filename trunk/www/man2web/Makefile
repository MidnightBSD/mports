# New ports collection makefile for:   man2web
# Date created:                2003-04-19
# Whom:                        Christian Weisgerber <naddy@freebsd.org>
#
# $MidnightBSD: mports/www/man2web/Makefile,v 1.1 2007/08/24 04:59:08 laffer1 Exp $
# $FreeBSD: ports/www/man2web/Makefile,v 1.6 2006/02/08 15:47:23 naddy Exp $
#

PORTNAME=	man2web
PORTVERSION=	0.88
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR= ${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert man pages to HTML
LICENSE=	agg
# gpl2 + gnu free doc license

GNU_CONFIGURE=	yes
CONFIGURE_TARGET= --build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--bindir="${PREFIX}/${CGIDIR}" \
		--sysconfdir="${PREFIX}/etc" \
		--with-manpath=/usr/share/man:${LOCALBASE}/man \
		--with-distro=freebsd --enable-lynx

PLIST_SUB=	CGIDIR="${CGIDIR}"
CGIDIR=	www/cgi-bin

MAN1=	man2web.1
MAN5=	man2web.conf.5

post-extract:
	${CP} ${FILESDIR}/freebsd.h ${WRKSRC}/src/section_h/

# default Apache configuration disallows symlinks in cgi-bin
post-install:
	${LN} -sf ${PREFIX}/${CGIDIR}/man2web ${PREFIX}/bin/man2web

.include <bsd.port.mk>
