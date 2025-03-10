PORTNAME=	tkshape
PORTVERSION=	0.4
PORTREVISION=	3
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://www.cs.man.ac.uk/~fellowsd/tcl/
DISTNAME=	shape${PORTVERSION:S/.//g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tk library to access to X Shaped Window Extension
WWW=		https://www.cs.man.ac.uk/~fellowsd/tcl/shapeidx.html

LICENSE=      TKSHAPE
LICENSE_NAME= TKSHAPE License
LICENSE_FILE=	${WRKSRC}/license.txt
LICENSE_PERMS=        dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		gmake tk:85+ xorg
USE_XORG=	x11 xext

PLIST_SUB=	PORTNAME="${PORTNAME}"

USE_LDCONFIG=	yes

OPTIONS=	MANPAGES "Install manual pages" on

.include <bsd.port.pre.mk>

.if defined(WITH_MANPAGES)
MAN3=		CombShape.3 QuryShape.3
MANN=		shape.n
.endif

WRKSRC=		${WRKDIR}/${PORTNAME:C/^tk//1}${PORTVERSION}

GNU_CONFIGURE=		yes
CONFIGURE_ARGS=		--with-tclconf=${TCL_LIBDIR} \
			--with-tkconf=${TK_LIBDIR}
CONFIGURE_WRKSRC=	${WRKSRC}/unix
BUILD_WRKSRC=	${CONFIGURE_WRKSRC}

WHERE_REPLACE=		${WRKSRC}/demos
REPLACE_FILES=		${WHERE_REPLACE}/dragger.tcl \
			${WHERE_REPLACE}/fancytext.tcl \
			${WHERE_REPLACE}/fingerprint.tcl

post-patch: .SILENT
	for FILE in ${REPLACE_FILES}; do \
		${REINPLACE_CMD} -e "/%%WISH%%/s//${WISH:S/\//\\\//g}/g" \
		$${FILE}; \
	done;
	${REINPLACE_CMD} -E 's,(^CFLAGS = )-g,\1${CFLAGS},' \
		${BUILD_WRKSRC}/Makefile.in

FIND_DIRS=		-type d \! -empty
FIND_DEMOS=		demos -type f -and -name "*.tcl" -maxdepth 1
FIND_IMAGES=		demos/images -type f \
			-and \( -name "*.gif" -or -name "*.xbm" \
			-or -name "*.cur" \)

TARGET_DIR=		${PREFIX}/lib/${PORTNAME}
MANPAGES=		CombShape.3 QuryShape.3 shape.n

do-install:
# script, library
	cd ${WRKSRC}; \
	${MKDIR} ${TARGET_DIR}/demos; \
	FILES=$$(${FIND} ${FIND_DEMOS}); \
	for FILE in $${FILES}; do \
		${INSTALL_SCRIPT} $${FILE} ${TARGET_DIR}/$${FILE}; \
	done; \
	${INSTALL_SCRIPT} unix/libshape04.so.1.0 ${TARGET_DIR}/libshape04.so.1;

# images, pkgIndex.tcl
	cd ${WRKSRC}; \
	${MKDIR} ${TARGET_DIR}/demos/images; \
	FILES=$$(${FIND} ${FIND_IMAGES}); \
	for FILE in $${FILES}; do \
		${INSTALL_DATA} $${FILE} ${TARGET_DIR}/$${FILE}; \
	done; \
	${INSTALL_DATA} unix/pkgIndex.tcl ${TARGET_DIR}/pkgIndex.tcl;

# manpages
.if ${PORT_OPTIONS:MMANPAGES}
	cd ${WRKSRC}; \
	for m in ${MANPAGES} ; do \
	    s=$${m##*.}; \
	    ${INSTALL_MAN} doc/$${m} ${PREFIX}/share/man/man$${s}/$${m}; \
	done;
.endif

.include <bsd.port.post.mk>
