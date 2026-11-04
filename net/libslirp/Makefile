PORTNAME=	libslirp
DISTVERSIONPREFIX=	v
DISTVERSION=	4.9.3
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose TCP-IP emulator library
WWW=		https://gitlab.freedesktop.org/slirp/libslirp

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

USES=		cpe gnome meson pkgconfig tar:bz2
USE_GNOME=	glib20
USE_LDCONFIG=	yes

CPE_VENDOR=	libslirp_project

USE_GITLAB=	yes
GL_SITE=	https://gitlab.freedesktop.org
GL_ACCOUNT=	slirp
.include <bsd.port.mk>
