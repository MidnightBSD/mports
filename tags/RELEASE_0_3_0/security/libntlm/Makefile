# $MidnightBSD: mports/security/libntlm/Makefile,v 1.2 2009/05/01 14:37:36 laffer1 Exp $

PORTNAME=	libntlm
PORTVERSION=	1.0
CATEGORIES=	security
MASTER_SITES=	http://josefsson.org/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library that implement Microsoft's NTLM authentication
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
