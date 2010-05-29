# New ports collection makefile for:   man2web
# Date created:                2003-04-19
# Whom:                        Christian Weisgerber <naddy@freebsd.org>
#
# $MidnightBSD: mports/www/man2web/Makefile,v 1.2 2008/10/08 04:43:52 laffer1 Exp $
# $FreeBSD: ports/www/man2web/Makefile,v 1.6 2006/02/08 15:47:23 naddy Exp $
#

PORTNAME=	man2web
PORTVERSION=	0.88
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

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
MAKE_JOBS_SAFE=	yes

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
