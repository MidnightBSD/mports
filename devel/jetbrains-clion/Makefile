PORTNAME=	clion
PORTVERSION=	2021.2.1
CATEGORIES=	devel java
MASTER_SITES=	https://download-cf.jetbrains.com/cpp/
PKGNAMEPREFIX=	jetbrains-
DISTNAME=	CLion-${PORTVERSION}
DIST_SUBDIR=	jetbrains

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JetBrains CLion IDE

LICENSE=	IntelliJ-CLion
LICENSE_NAME=	Subscription license agreement for business and organizations
LICENSE_TEXT=	See: https://www.jetbrains.com/store/license.html
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

RUN_DEPENDS=	intellij-fsnotifier>0:java/intellij-fsnotifier \
		lsof:sysutils/lsof

USES=		python:run shebangfix

USE_JAVA=	yes
JAVA_VERSION=	11+

SHEBANG_FILES=	bin/printenv.py bin/restart.py \
		plugins/python-ce/helpers/typeshed/scripts/generate_proto_stubs.sh

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	${PORTNAME} ${PORTNAME}.desktop pkg-message

WRKSRC=		${WRKDIR}/clion-${PORTVERSION}

do-install:
# Linux/Windows/OS X only so remove them
	-${RM} -r \
		${WRKSRC}/bin/clang \
		${WRKSRC}/bin/cmake \
		${WRKSRC}/bin/fsnotifier \
		${WRKSRC}/bin/fsnotifier-arm \
		${WRKSRC}/bin/fsnotifier64 \
		${WRKSRC}/bin/gdb/linux \
		${WRKSRC}/bin/lldb/linux \
		${WRKSRC}/jbr \
		${WRKSRC}/jre64 \
		${WRKSRC}/lib/pty4j-native \
		${WRKSRC}/plugins/cwm-plugin/quiche-native \
		${WRKSRC}/plugins/performanceTesting/bin
	${MKDIR} ${DATADIR}
	@(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${DATADIR} \
		"! -name *\.bak ! -name *\.so ! -name *\.dll ! -name *\.dylib ! -name *\.pdb ! -name *\.sh")
	@(cd ${WRKSRC} && ${COPYTREE_BIN} . ${DATADIR} "-name *\.sh")
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${PREFIX}/bin/${PORTNAME}
	${INSTALL_MAN} ${FILESDIR}/${PORTNAME}.1 ${PREFIX}/share/man/man1
	${INSTALL_DATA} ${WRKDIR}/${PORTNAME}.desktop ${PREFIX}/share/applications/
# Use fsnotifier replacement provided by java/intellij-fsnotifier
	${ECHO} "idea.filewatcher.executable.path=${TRUE_PREFIX}/intellij/bin/fsnotifier" >> ${DATADIR}/bin/idea.properties

.include <bsd.port.mk>
