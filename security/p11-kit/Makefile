# $MidnightBSD: mports/security/p11-kit/Makefile,v 1.1 2011/09/10 21:36:36 laffer1 Exp $
# $FreeBSD: ports/security/p11-kit/Makefile,v 1.3 2011/09/07 04:07:06 novel Exp $

PORTNAME=	p11-kit
PORTVERSION=	0.11
CATEGORIES=	security devel
MASTER_SITES=	http://p11-glue.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for loading and enumurating of PKCS\#11 modules
LICENSE=	bsd3

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-gtk-doc --disable-nls --enable-debug=no
MAKE_ENV=	exampledir=${EXAMPLESDIR}

USE_AUTOTOOLS=	libtool
USE_GNOME=	ltverhack gnomehack
USE_LDCONFIG=	yes

pre-configure:
	@${REINPLACE_CMD} -e \
	's|exampledir = $$(p11_system_config)|exampledir = ${EXAMPLESDIR}|' \
	${WRKSRC}/${PORTNAME}/Makefile.in

.include <bsd.port.mk>
