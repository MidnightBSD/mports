PORTNAME=	leonardo
DISTVERSION=	0.1.1
CATEGORIES=	www
MASTER_SITES=	https://github.com/MidnightBSD/leonardo/releases/download/v${DISTVERSION}/
EXTRACT_SUFX=	.tar

MAINTAINER=	luke@foolishgames.com
COMMENT=	S3-compatible object storage server backed by a POSIX filesystem
WWW=		https://github.com/MidnightBSD/leonardo

LICENSE=	Apache-2.0

USES=		java
JAVA_VERSION=	21+
NO_ARCH=	yes
NO_BUILD=	yes

USE_RC_SUBR=	leonardo
USERS=		leonardo
GROUPS=		leonardo

SUB_LIST=	JAVA="${JAVA}"

post-patch:
# The Gradle launcher derives APP_HOME from its own location, which would be
# ${PREFIX} once installed into bin/.  Pin it to the real install location
# and default JAVA_HOME to the JDK selected by the framework.
	@${REINPLACE_CMD} \
		-e 's|^MAX_FD=maximum|APP_HOME=${PREFIX}/share/java/leonardo; &|' \
		-e 's|^if \[ -n "$$JAVA_HOME" \] ; then|: $${JAVA_HOME:=${JAVA_HOME}}; &|' \
		${WRKSRC}/bin/leonardo

do-install:
	${MKDIR} ${PREFIX}/share/java/leonardo/lib
	${INSTALL_DATA} ${WRKSRC}/lib/*.jar \
		${PREFIX}/share/java/leonardo/lib/
	${INSTALL_SCRIPT} ${WRKSRC}/bin/leonardo \
		${PREFIX}/bin/leonardo
	${MKDIR} ${PREFIX}/etc/leonardo
	${INSTALL_DATA} ${FILESDIR}/leonardo.yaml.sample \
		${PREFIX}/etc/leonardo/
	${INSTALL_DATA} ${FILESDIR}/api-keys.yaml.sample \
		${PREFIX}/etc/leonardo/

post-install:
	@${ECHO_MSG} ""
	@${ECHO_MSG} "===> Leonardo installed."
	@${ECHO_MSG} "     1. Edit ${PREFIX}/etc/leonardo/leonardo.yaml."
	@${ECHO_MSG} "     2. Copy ${PREFIX}/etc/leonardo/api-keys.yaml.sample to"
	@${ECHO_MSG} "        /var/leonardo/config/api-keys.yaml, add your keys,"
	@${ECHO_MSG} "        then chmod 0600 the file."
	@${ECHO_MSG} "     3. Add 'leonardo_enable=\"YES\"' to /etc/rc.conf"
	@${ECHO_MSG} "     4. service leonardo start"
	@${ECHO_MSG} ""

.include <bsd.port.mk>
