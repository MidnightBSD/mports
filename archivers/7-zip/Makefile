PORTNAME=	7-zip
DISTVERSION=	22.01
CATEGORIES=	archivers
MASTER_SITES=	https://www.7-zip.org/a/
DISTNAME=	7z${DISTVERSION:S/.//}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Console version of the 7-Zip file archiver
WWW=		https://www.7-zip.org/

CONFLICTS_INSTALL=	p7zip

LICENSE=	bsd3 lgpl2.1+ UNRAR
LICENSE_COMB=	multi
LICENSE_NAME_UNRAR=	unRAR license
LICENSE_FILE_bsd3=	${WRKSRC}/DOC/License.txt
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/DOC/copying.txt
LICENSE_FILE_UNRAR=	${WRKSRC}/DOC/unRarLicense.txt
LICENSE_PERMS_UNRAR=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

LIB_DEPENDS=	libsysinfo.so:devel/libsysinfo

USES=		7z cpe dos2unix gmake localbase

CPE_VENDOR=	7-zip

MAKEFILE=	../../cmpl_clang.mak
MAKE_ARGS=	LOCAL_FLAGS="${CFLAGS}" \
		LOCAL_LIBS="${LIBS} -lsysinfo"
CFLAGS_aarch64?=	-march=armv8-a+crc+crypto

NO_WRKSUBDIR=	yes
BUILD_WRKSRC=	${WRKSRC}/CPP/7zip/Bundles/Alone2
DOS2UNIX_FILES=	C/CpuArch.c \
		C/7zCrc.c \
		C/Aes.c \
		C/AesOpt.c \
		C/Sha1Opt.c \
		C/Sha256Opt.c \
		CPP/7zip/7zip_gcc.mak \
		CPP/7zip/var_gcc.mak \
		CPP/Windows/SystemInfo.cpp

PLIST_FILES=	bin/7z \
		bin/7zz \
		share/man/man1/7zz.1.gz
PORTDOCS=	7zC.txt 7zFormat.txt Methods.txt \
		lzma.txt readme.txt src-history.txt

OPTIONS_DEFINE=	DOCS

post-patch:
	${ECHO_CMD} > ${WRKSRC}/CPP/7zip/warn_clang.mak

do-install:
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/b/c/7zz ${STAGEDIR}/${PREFIX}/bin
	${LN} -sf 7zz ${STAGEDIR}/${PREFIX}/bin/7z
	${INSTALL_MAN} ${FILESDIR}/7zz.1 ${STAGEDIR}/${PREFIX}/share/man/man1

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR} && \
	${INSTALL_DATA} ${PORTDOCS:C,^,${WRKSRC}/DOC/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
