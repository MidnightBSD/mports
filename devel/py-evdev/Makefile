PORTNAME=	evdev
PORTVERSION=	1.9.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bindings to the Linux input handling subsystem

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent distutils pytest
# Upstream Linux/proc assertions fail and test_write waits for unsupported POLLOUT.
NO_TEST=	yes
CPPFLAGS+=	-I${LOCALBASE}/include # v4l_compat

EVDEV_INCLUDES=	${LOCALBASE}/include

PYDISTUTILS_BUILD_TARGET=	build_ecodes
PYDISTUTILS_BUILDARGS+=	--evdev-headers \
			${EVDEV_INCLUDES}/linux/input.h:${EVDEV_INCLUDES}/linux/input-event-codes.h:${EVDEV_INCLUDES}/linux/uinput.h
PYDISTUTILS_BUILDARGS+=	build_ext --include-dirs ${EVDEV_INCLUDES}

# Supply install target with evdev headers path
PYDISTUTILS_INSTALL_TARGET=	${PYDISTUTILS_BUILD_TARGET} \
				${PYDISTUTILS_BUILDARGS} install

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		-name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
