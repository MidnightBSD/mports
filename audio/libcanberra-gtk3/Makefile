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
# fix the .la file so it doesn't point to the build dir anymore.
	@${REINPLACE_CMD} -e '/^relink_command/ d' \
		-e 's|${WRKSRC}/src/libcanberra.la|${LOCALBASE}/lib/libcanberra.la|g' \
		${WRKSRC}/src/.libs/libcanberra-gtk3.la

do-install:
	${INSTALL_DATA} ${WRKSRC}/libcanberra-gtk3.pc \
		${PREFIX}/libdata/pkgconfig/
.for i in .a .la .so .so.0
	${INSTALL_DATA} ${WRKSRC}/src/.libs/libcanberra-gtk3${i} \
		${PREFIX}/lib/
.endfor
	cd ${WRKSRC}/src && ${GMAKE} install-gtk3moduleLTLIBRARIES
	cd ${PREFIX}/lib/gtk-3.0/modules && \
		${LN} -sf libcanberra-gtk3-module.so libcanberra-gtk-module.so

.include "${MASTERDIR}/Makefile"
