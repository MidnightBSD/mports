PORTNAME=	libvirt
PORTVERSION=	12.9.0
CATEGORIES=	devel
MASTER_SITES=	http://libvirt.org/sources/python/ \
		ftp://libvirt.org/libvirt/python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}_python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for Libvirt virtualization API
WWW=		https://libvirt.org/python.html

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libvirt.so:devel/libvirt

USES=		cpe pkgconfig python:3.9+ shebangfix
CPE_VENDOR=	redhat
SHEBANG_FILES=	generator.py setup.py
USE_PYTHON=	distutils autoplist

post-install:
.for lib in libvirtmod libvirtmod_qemu libvirtmod_lxc
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_LIBDIR}/site-packages/${lib}*.so
.endfor

.include <bsd.port.mk>
