// Shows one file with pro
// Compile using:
// g++ FILENAME -std=c++17 lstdc++fs

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <filesystem>
#include <iterator>
#include <set>
#include <algorithm>

namespace fs = std::filesystem;
std::string org_extension {".org"};
std::vector<fs::path> get_org_files(const std::string& dirname);
std::vector<std::string> create_org_links (std::vector<fs::path>& files);
int main (int argc, char** argv) {

    std::ofstream outfile("tmp.org");
    
    std::vector<std::string> params(argv + 1, argv + argc);
    for (auto& dir: params) {
        auto x = get_org_files(dir);
        auto links = create_org_links(x);
        for (auto& lnk: links) {
            outfile << lnk;
        }
    }
    outfile.close();
}

std::vector<std::string> create_org_links (std::vector<fs::path>& files) {
    //+ [[file:"${basename}"]["${description}"]]\n
    std::vector<std::string> res;
    res.reserve(files.size());
    
    for (auto& path: files) {
        auto basename = path.filename().string();
        auto description = path.stem().string();
        std::replace(description.begin(), description.end(), '-', ' ');

        res.emplace_back("+ [[file:" + basename + "][" + description + "]]\n");
    }
    return res;
}

std::vector<fs::path> get_org_files(const std::string& dirname) {
    std::vector<fs::path> res;
    for(auto& p: fs::directory_iterator(dirname)) {
        if (p.path().extension() == org_extension) {
            res.push_back(p.path());
        }
    }
    return res;
}
