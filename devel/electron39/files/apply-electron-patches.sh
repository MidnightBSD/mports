#! /bin/sh

PATH=/bin:/usr/bin:/usr/local/bin

PATCH_CMD="patch"
PATCH_FLAGS="-Np1"

WRKSRC=$1
PATCH_CONF=${WRKSRC}/electron/patches/config.json

PATCHD_REPOD_PAIRS=$(jq -r '.[] | .patch_dir + ":" + .repo' "${PATCH_CONF}")
for prp in ${PATCHD_REPOD_PAIRS}; do
    pd=$(echo "${prp}" | awk -F: '{print $1}' | sed -e 's/src/./')
    rd=$(echo "${prp}" | awk -F: '{print $2}' | sed -e 's/src/./')
    (cd "${WRKSRC}/${rd}" && \
         while read -r p; do
             patch_file="${WRKSRC}/${pd}/${p}"
             if ${PATCH_CMD} ${PATCH_FLAGS} --dry-run -R -i "${patch_file}" >/dev/null 2>&1; then
                 echo "===>  Patch already applied: ${p}"
             else
                 ${PATCH_CMD} ${PATCH_FLAGS} -i "${patch_file}"
             fi
         done < "${WRKSRC}/${pd}/.patches")
done
