PORTNAME=	libvirt
PORTVERSION=	8.10.0
CATEGORIES=	devel
MASTER_SITES=	http://libvirt.org/sources/python/ \
		ftp://libvirt.org/libvirt/python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for Libvirt virtualization API
WWW=		https://libvirt.org/python.html

LICENSE=	gpl2

LIB_DEPENDS=	libvirt.so:devel/libvirt

USES=		cpe pkgconfig python:3.6+ shebangfix
CPE_VENDOR=	redhat
SHEBANG_FILES=	generator.py setup.py
USE_PYTHON=	distutils autoplist

post-install:
.for lib in libvirtmod libvirtmod_qemu libvirtmod_lxc
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_LIBDIR}/site-packages/${lib}*.so
.endfor

.include <bsd.port.mk>
