PORTREVISION=	0
CATEGORIES=	misc devel
PKGNAMESUFFIX=	-libuuid

COMMENT=	UUID library from e2fsprogs package

LICENSE=	bsd3
LICENSE_FILE=	${INSTALL_WRKSRC}/COPYING

CONFLICTS=	ossp-uuid-[0-9]*

CONFIGURE_ARGS=	--enable-elf-shlibs --enable-libuuid

WITHOUT_NLS=	yes
OPTIONS_EXCLUDE=	NLS
OPTIONSFILE=	# works around optionsNG trouble
MASTERDIR=	${.CURDIR}/../../filesystems/e2fsprogs-core
MAKE_ARGS=	LIB_SUBDIRS=lib/uuid
USE_LDCONFIG=	yes
ALL_TARGET=	libs
INSTALL_TARGET=	install install-shlibs
INSTALL_WRKSRC=	${WRKSRC}/lib/uuid
FILESDIR=	${.CURDIR}/files
USE_RC_SUBR=	uuidd

PKGDIR=		${.CURDIR}

post-patch::
	${REINPLACE_CMD} -e 's,/var/lib/libuuid,/var/run/libuuid,g' \
	    -e 's,/usr/sbin/uuidd,${PREFIX}/sbin/uuidd,' \
	    ${WRKSRC}/lib/uuid/*.[ch]

pre-build:
	${MKDIR} ${WRKSRC}/lib/uuid/elfshared
	cd ${WRKSRC}/util && ${MAKE_CMD} subst

# ulimit guards against runaway tests
# failure to launch uuidd is fine (one might be running, or we may lack
# privileges); if it works, it'll quit after 50 seconds
post-build:
	cd ${WRKSRC}/misc && ${MAKE_CMD} uuidgen uuidgen.1 uuidd uuidd.8
	cd ${INSTALL_WRKSRC} && ( ulimit -t 5 && ${MAKE_CMD} check )

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/misc/uuidgen ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/misc/uuidgen.1 ${PREFIX}/share/man/man1/
	${INSTALL_PROGRAM} ${WRKSRC}/misc/uuidd ${PREFIX}/sbin/
	${INSTALL_MAN} ${WRKSRC}/misc/uuidd.8 ${PREFIX}/share/man/man8/
	${MKDIR} /var/run/libuuid

.include "${MASTERDIR}/Makefile"
