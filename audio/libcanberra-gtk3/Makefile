# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	audio devel
PKGNAMESUFFIX=	-gtk3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the Freedesktop sound theme spec

MASTERDIR=	${.CURDIR}/../../audio/libcanberra
SLAVEPORT=	gtk3
PLIST=		${.CURDIR}/pkg-plist

do-build:
	cd ${WRKSRC} && ${GMAKE} libcanberra-gtk3.pc
	cd ${WRKSRC}/src && ${GMAKE} libcanberra-gtk3.la
	cd ${WRKSRC}/src && ${GMAKE} libcanberra-gtk3-module.la

do-install:
	${INSTALL_DATA} ${WRKSRC}/libcanberra-gtk3.pc \
		${PREFIX}/libdata/pkgconfig/
.for i in .so .so.0 .so.0.1.9
	${INSTALL_LIB} ${WRKSRC}/src/.libs/libcanberra-gtk3${i} \
		${PREFIX}/lib/
.endfor
	cd ${WRKSRC}/src && env DESTDIR=${FAKE_DESTDIR} ${GMAKE} ${FAKE_MAKEARGS} install-gtk3moduleLTLIBRARIES
	${LN} -sf libcanberra-gtk3-module.so \
		${PREFIX}/lib/gtk-3.0/modules/libcanberra-gtk-module.so

.include "${MASTERDIR}/Makefile"
