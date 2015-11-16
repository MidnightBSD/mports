# $MidnightBSD$
# $FreeBSD: ports/net/py-avahi/Makefile,v 1.16 2008/07/03 21:53:55 mezz Exp $

PORTREVISION=	0
CATEGORIES=	net gnome python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to the Avahi mDNS system

LICENSE=	lgpl

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/gdbm.so:${PORTSDIR}/databases/py-gdbm \
		${PYTHON_SITELIBDIR}/dbus/_dbus.py:${PORTSDIR}/devel/py-dbus
LIB_DEPENDS=	libavahi-client.so:${PORTSDIR}/net/avahi-app
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/gdbm.so:${PORTSDIR}/databases/py-gdbm \
		${PYTHON_SITELIBDIR}/dbus/_dbus.py:${PORTSDIR}/devel/py-dbus

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-python
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	python

USES+=		python:2
USE_GNOME=	pygtk2

post-patch:
	@${REINPLACE_CMD} -e 's|@pkglibdir@|${DATADIR}|' \
	    	${WRKSRC}/avahi-python/avahi/ServiceTypeDatabase.py.in

pre-build:
	@cd ${BUILD_WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} \
	    	Makefile ${MAKE_ARGS} clean

post-build:
	@cd ${WRKSRC}/service-type-database && ${SETENV} ${MAKE_ENV} ${GMAKE} \
		${MAKE_FLAGS} Makefile ${MAKE_ARGS} ${ALL_TARGET}

post-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/service-type-database/service-types.db ${DATADIR}
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py -l ${PYTHONPREFIX_SITELIBDIR}/avahi
	@${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py -l ${PYTHONPREFIX_SITELIBDIR}/avahi

.include "${MASTERDIR}/Makefile"
