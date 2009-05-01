# $MidnightBSD: mports/security/libntlm/Makefile,v 1.1 2007/12/28 20:32:33 laffer1 Exp $

PORTNAME=	libntlm
PORTVERSION=	1.0
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
