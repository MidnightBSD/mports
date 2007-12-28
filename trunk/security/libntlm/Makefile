# ex:ts=8
# Ports collection makefile for:	libntlm
# Date created:			Oct 19, 2003
# Whom:				ijliao
#
# $MidnightBSD$
# $FreeBSD: ports/security/libntlm/Makefile,v 1.10 2007/01/28 09:07:43 kris Exp $
#

PORTNAME=	libntlm
PORTVERSION=	0.3.6
CATEGORIES=	security
MASTER_SITES=	http://josefsson.org/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library that implement Microsoft's NTLM authentication
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
