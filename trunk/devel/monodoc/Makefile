# New ports collection makefile for:    MonoDoc
# Date created:         2004-08-13
# Friday the 13th!
# Whom:                 Christopher Nehren
#
# $MidnightBSD: mports/devel/monodoc/Makefile,v 1.2 2008/09/18 21:01:41 laffer1 Exp $
# $FreeBSD: ports/devel/monodoc/Makefile,v 1.15 2007/03/17 03:48:35 tmclaugh Exp $
#

PORTNAME=	monodoc
PORTVERSION=	1.2.5
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	http://ftp.novell.com/pub/mono/sources/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Documentation for Mono and Mono libraries
LICENSE=	unknown

BUILD_DEPENDS=	mono:${PORTSDIR}/lang/mono
RUN_DEPENDS=	mono:${PORTSDIR}/lang/mono

USE_GNOME=	gnomehack
USE_ZIP=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes

MAN1=		mdnormalizer.1 mdvalidator.1 monodocer.1 monodocs2html.1 \
		mdassembler.1 mdcs2ecma.1

.include "${.CURDIR}/../../lang/mono/bsd.mono.mk"
.include <bsd.port.mk>
